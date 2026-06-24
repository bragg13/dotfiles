#!/bin/bash
# Bootstrap TPM (tmux plugin manager) if not already installed
TPM_DIR="$HOME/.tmux/plugins/tpm"

if [ ! -d "$TPM_DIR" ]; then
  echo "==> Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  echo "==> TPM installed. Open tmux and press prefix + I to install plugins."
fi
