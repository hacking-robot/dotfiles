#!/bin/bash
set -e

echo "=== dotfiles install ==="

# Clone dotfiles bare repo if not already present
if [ ! -d "$HOME/.cfg" ]; then
  echo "Cloning dotfiles..."
  git clone --bare git@github.com:hacking-robot/dotfiles.git "$HOME/.cfg"
  /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" checkout
  /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" config --local status.showUntrackedFiles no
  echo "Dotfiles checked out."
else
  echo "Dotfiles repo already exists, pulling latest..."
  /usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME" pull
fi

# Neovim (symlink nvim-config -> nvim)
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

# Ghostty (already at ~/.config/ghostty/config via checkout)
if [ -f "$HOME/.config/ghostty/config" ]; then
  echo "Ghostty config ready."
else
  echo "Warning: Ghostty config not found. Re-run checkout."
fi

# zsh, zimfw, tmux (already at $HOME via checkout)
echo "zshrc, zimrc, tmux.conf ready."

# Install zimfw if not present
if [ ! -d "$HOME/.zim" ]; then
  echo "Installing zimfw..."
  curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
else
  echo "zimfw already installed."
fi

echo "=== done ==="
echo "Restart your shell or run: source ~/.zshrc"
