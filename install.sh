#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

echo "==> Installing required tools"
sudo dnf install -y \
  git \
  stow \
  zsh \
  tmux \
  neovim \
  ripgrep \
  fzf \
  zoxide \
  wl-clipboard \
  fd-find

echo "==> Stowing dotfiles"
cd "$DOTFILES"

stow zsh
stow git
stow tmux
stow nvim
stow starship

echo "==> Done"
echo
echo "Dotfiles installed."
echo "Restart your shell or run:"
echo "  exec zsh"
