## Installing your dotfiles onto a new system (or migrate to this setup) (ndr: guide taken from some place online)
- Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:
  ```bash
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  ```
  
- And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:
  ```bash
  echo ".cfg" >> .gitignore
  ```
  
- Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:
  ```bash
  git clone --bare <git-repo-url> $HOME/.cfg
  ```
  
- Define the alias in the current shell scope:
  ```bash
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  ```
  
- Checkout the actual content from the bare repository to your $HOME:
  ```bash
  config checkout
  ```
  
The step above might fail with a message like:
```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

```bash
  mkdir -p .config-backup && \
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
  xargs -I{} mv {} .config-backup/{}
```

Re-run the check out if you had problems:
  ```bash
  config checkout
  ```

Set the flag showUntrackedFiles to no on this specific (local) repository:
```bash
config config --local status.showUntrackedFiles no
```

You're done, from now on you can now type config commands to add and update your dotfiles:
```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

## Fresh install commands to run
```bash
#!/bin-bash

; basics
sudo apt update && sudo apt upgrade
sudo apt install git snap unzip -y

; fish shell + z 
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
sudo apt install fzf
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
chsh -s $which(fish)

; eza
sudo apt install -y gpg
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

; neovim
sudo snap install --beta nvim --classic
sudo npm install -g neovim
sudo pip install neovim

; python
sudo apt install python3 python3-pip -y

; nodejs and npm
sudo apt install nodejs npm -y
sudo npm install -g n
sudo n latest

; neovim utils
sudo apt install fd-find -y
sudo npm install -g prettier
sudo apt install ripgrep -y
npm install -g @fsouza/prettierd
npx @johnnymorganz/stylua-bin

; lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

; check if it worked out
nvim 'c ":LazyHealth"
```
