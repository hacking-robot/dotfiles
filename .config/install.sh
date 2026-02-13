#!/bin/bash
set -e

echo "=== dotfiles install ==="

# --- Homebrew ---
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew already installed."
fi

# --- Brew packages ---
FORMULAE=(neovim tmux spaceship zimfw nvm)
CASKS=(ghostty aerospace)

echo "Installing brew formulae..."
for pkg in "${FORMULAE[@]}"; do
  if brew list "$pkg" &>/dev/null; then
    echo "  $pkg already installed."
  else
    echo "  Installing $pkg..."
    brew install "$pkg"
  fi
done

echo "Installing brew casks..."
for cask in "${CASKS[@]}"; do
  if brew list --cask "$cask" &>/dev/null; then
    echo "  $cask already installed."
  else
    echo "  Installing $cask..."
    brew install --cask "$cask"
  fi
done

# --- Bun ---
if ! command -v bun &>/dev/null; then
  echo "Installing Bun..."
  curl -fsSL https://bun.sh/install | bash
else
  echo "Bun already installed."
fi

# --- Dotfiles ---
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

# --- Neovim (symlink) ---
if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
  echo "nvim config already exists at ~/.config/nvim (not a symlink), skipping..."
  echo "  Remove it manually and re-run to link: rm -rf ~/.config/nvim"
elif [ -L "$HOME/.config/nvim" ]; then
  echo "nvim already linked."
else
  echo "Linking neovim config..."
  ln -s "$HOME/.config/nvim-config" "$HOME/.config/nvim"
  echo "nvim config linked. Run nvim to bootstrap plugins."
fi

# --- Tmux Plugin Manager ---
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  echo "TPM installed. Press prefix + I inside tmux to install plugins."
else
  echo "TPM already installed."
fi

# --- Zimfw ---
if [ ! -d "$HOME/.zim" ]; then
  echo "Installing zimfw modules..."
  zsh -c 'source /opt/homebrew/opt/zimfw/share/zimfw.zsh init'
else
  echo "zimfw already installed."
fi

echo ""
echo "=== done ==="
echo "Restart your shell or run: source ~/.zshrc"
