# dotfiles

Managed with [chezmoi](https://chezmoi.io). Three profiles:

| Profile | Use case | Tools | Configs |
|---------|----------|-------|---------|
| `full` | macOS main machine | full Brewfile | everything |
| `linux` | Linux desktop/laptop | apt + manual installs | everything except karabiner, raycast |
| `minimal` | Remote server / VPS | nvim, lazygit | nvim, lazygit, git |

---

## Bootstrap

### macOS (full)

```sh
# Install Homebrew if needed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install chezmoi and apply dotfiles
brew install chezmoi
chezmoi init --apply bragg13
```

When prompted, enter `full`.

Then install tmux plugins: open tmux and press `prefix + I`.  
Then install fish plugins: open fish and run `fisher update`.

### Linux (full)

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply bragg13
```

When prompted, enter `linux`.

### Remote server (minimal — nvim + lazygit only)

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply bragg13
```

When prompted, enter `minimal`.

---

## Daily workflow

```sh
# Edit a config through chezmoi (keeps source in sync)
chezmoi edit ~/.config/fish/config.fish

# Or edit files directly, then re-add
chezmoi add ~/.config/nvim/lua/plugins/editor.lua

# Preview what would change before applying
chezmoi diff

# Apply all pending changes
chezmoi apply

# Pull latest from GitHub and apply
chezmoi update
```

To commit and push changes to the repo:

```sh
cd $(chezmoi source-path)
git add -A
git commit -m "your message"
git push
```

---

## Contents

```
dotfiles/
├── dot_config/
│   ├── nvim/          # LazyVim config + plugins
│   ├── fish/          # fish shell, tide prompt, aliases, functions
│   ├── lazygit/
│   ├── kitty/         # full only
│   ├── zed/           # full only
│   ├── zellij/
│   ├── helix/
│   ├── karabiner/     # full/macOS only
│   └── uv/
├── dot_gitconfig.tmpl # git config (templated per OS)
├── dot_tmux.conf      # tmux + TPM plugins (catppuccin, sensible)
├── Brewfile           # full macOS packages
└── scripts/
    ├── run_once_install-packages.sh.tmpl   # installs tools on first apply
    ├── run_once_macos-defaults.sh.tmpl     # macOS system preferences (full only)
    ├── run_once_install-fonts.sh.tmpl      # DaddyTimeMono Nerd Font
    └── run_once_install-tpm.sh             # bootstraps TPM for tmux
```

## Notes

- `run_once_` scripts run exactly once per machine (chezmoi tracks them by hash)
- To re-run a script, rename it or delete its entry from `~/.local/share/chezmoi/.chezmoi.state.boltdb`
- Secrets: not currently tracked. When needed, chezmoi supports age encryption and 1Password/Bitwarden integration
