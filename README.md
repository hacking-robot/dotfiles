# dotfiles

My macOS dotfiles managed with a bare git repo.

## Quick Setup

```bash
# On a fresh Mac, run:
curl -fsSL https://raw.githubusercontent.com/hacking-robot/dotfiles/master/.config/install.sh | bash

# Then install apps:
~/.config/install-apps.sh

# Then set macOS defaults:
~/.config/macos-defaults.sh
```

## What's Included

### Configs

| File | Description |
|------|-------------|
| `.zshrc` | Zsh config with vi mode, Spaceship prompt, zimfw |
| `.zimrc` | Zimfw modules (completions, syntax highlighting, autosuggestions) |
| `.tmux.conf` | Tmux with vi keys, mouse support, Catppuccin theme |
| `.gitconfig` | Git user config + LFS |
| `.aerospace.toml` | AeroSpace tiling window manager bindings |
| `.config/ghostty/config` | Ghostty terminal (Gruvbox Dark, Hack Nerd Font) |
| `.config/nvim-config/` | Neovim (NvChad v2.5) |

### Install Scripts

| Script | Description |
|--------|-------------|
| `~/.config/install.sh` | Homebrew, CLI tools, dotfiles checkout, symlinks |
| `~/.config/install-apps.sh` | macOS GUI apps (Brave, Claude, Docker, Obsidian, etc.) |
| `~/.config/macos-defaults.sh` | macOS system preferences (keyboard, Finder, Dock, trackpad) |

### CLI Tools (via Homebrew)

neovim, tmux, spaceship, zimfw, nvm, bun

### Apps (via Homebrew Cask)

Ghostty, AeroSpace, Brave, Claude, Docker, DuckDuckGo, Chrome, Obsidian, Ollama, Proton Mail, Proton Pass, Steam, Superwhisper, TradingView, Zed

## Usage

This repo uses the [bare git repo](https://www.atlassian.com/git/tutorials/dotfiles) method.

```bash
# Alias (already in .zshrc)
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Common commands
config status
config add ~/.some-config
config commit -m "Update config"
config push
```
