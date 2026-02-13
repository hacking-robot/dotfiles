#!/bin/bash
set -e

echo "=== dotfiles install ==="

# Install neovim config
if [ -d "$HOME/.config/nvim" ]; then
  echo "nvim config already exists at ~/.config/nvim, skipping..."
else
  echo "Setting up neovim..."
  mkdir -p "$HOME/.config/nvim"
  cp "$HOME/.config/nvim-config/init.lua" "$HOME/.config/nvim/init.lua"
  cp "$HOME/.config/nvim-config/lazy-lock.json" "$HOME/.config/nvim/lazy-lock.json"
  cp -r "$HOME/.config/nvim-config/lua" "$HOME/.config/nvim/lua"
  echo "nvim config installed. Run nvim to bootstrap plugins."
fi

echo "=== done ==="
