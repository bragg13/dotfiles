#!/bin/bash
set -e

# Detect package manager
if command -v apt-get &>/dev/null; then
  PM="apt"
else
  echo "Unsupported package manager. Only apt is supported for now."
  exit 1
fi

echo "==> Updating package list..."
sudo apt-get update -y

echo "==> Installing base packages..."
sudo apt-get install -y \
  fish \
  neovim \
  tmux \
  fzf \
  ripgrep \
  bat \
  tree \
  tldr \
  zsh \
  curl \
  git \
  unzip \
  build-essential

echo "==> Installing eza..."
sudo apt-get install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
  | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
  | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt-get update -y
sudo apt-get install -y eza

echo "==> Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo "==> Installing git-delta..."
DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" \
  | grep '"tag_name"' | sed 's/.*"\([^"]*\)".*/\1/')
curl -Lo /tmp/delta.deb \
  "https://github.com/dandavison/delta/releases/latest/download/git-delta_${DELTA_VERSION}_arm64.deb"
sudo dpkg -i /tmp/delta.deb
rm /tmp/delta.deb

echo "==> Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" \
  | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
curl -Lo /tmp/lazygit.tar.gz \
  "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar -xf /tmp/lazygit.tar.gz -C /tmp lazygit
sudo install /tmp/lazygit /usr/local/bin
rm /tmp/lazygit.tar.gz /tmp/lazygit

echo "==> Installing gh (GitHub CLI)..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
  | sudo tee /etc/apt/sources.list.d/github-cli.list
sudo apt-get update -y
sudo apt-get install -y gh

echo "==> Setting fish as default shell..."
command -v fish | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"

echo "==> Done. Log out and back in for fish to take effect."
