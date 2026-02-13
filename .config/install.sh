#!/bin/bash
set -e

echo "=== dotfiles install ==="

# Install neovim config (symlink so edits go straight to dotfiles)
if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  echo "nvim config already exists at ~/.config/nvim (not a symlink), skipping..."
  echo "  Remove it manually and re-run to link: rm -rf ~/.config/nvim"
elif [ -L "$HOME/.config/nvim" ]; then
  echo "nvim already linked, skipping..."
else
  echo "Setting up neovim..."
  ln -s "$HOME/.config/nvim-config" "$HOME/.config/nvim"
  echo "nvim config linked. Run nvim to bootstrap plugins."
fi

echo "=== done ==="
