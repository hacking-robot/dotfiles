#!/bin/bash
set -e

echo "=== macOS apps install ==="

# Requires Homebrew
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Run install.sh first."
  exit 1
fi

CASKS=(
  brave-browser
  claude
  docker
  duckduckgo
  google-chrome
  obsidian
  ollama
  proton-mail
  proton-pass
  steam
  superwhisper
  tradingview
  zed
)

for cask in "${CASKS[@]}"; do
  if brew list --cask "$cask" &>/dev/null; then
    echo "  $cask already installed."
  else
    echo "  Installing $cask..."
    brew install --cask "$cask"
  fi
done

echo ""
echo "=== done ==="
