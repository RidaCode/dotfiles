#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
TPM="$HOME/.tmux/plugins/tpm"

echo "==> Installing base tools"

sudo dnf install -y \
  git \
  stow \
  zsh \
  tmux \
  neovim \
  ripgrep \
  fzf \
  zoxide \
  eza \
  wl-clipboard \
  fd-find \
  curl \
  wget \
  util-linux-user

# ==================================================
# STARSHIP
# ==================================================

echo "==> Installing Starship"

if ! command -v starship >/dev/null 2>&1; then
  sudo dnf copr enable -y atim/starship
  sudo dnf install -y starship
else
  echo "Starship already installed"
fi

# ==================================================
# DOTFILES
# ==================================================

echo "==> Stowing dotfiles"

cd "$DOTFILES"

stow --restow zsh
stow --restow git
stow --restow tmux
stow --restow nvim
stow --restow starship
stow --restow power

# ==================================================
# ZSH
# ==================================================

ZSH_PATH="$(command -v zsh)"

if [[ "$(getent passwd "$USER" | cut -d: -f7)" != "$ZSH_PATH" ]]; then
  echo "==> Setting zsh as login shell"
  chsh -s "$ZSH_PATH"
else
  echo "==> zsh is already the login shell"
fi

# ==================================================
# TPM
# ==================================================

echo "==> Installing Tmux Plugin Manager"

if [[ ! -d "$TPM/.git" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM"
else
  echo "TPM already installed"
  git -C "$TPM" pull --ff-only
fi

# ==================================================
# TMUX PLUGINS
# ==================================================

echo "==> Installing tmux plugins"

"$TPM/bin/install_plugins"

# ==================================================
# POWER / DISPLAY LOCK SERVICE
# ==================================================

echo "==> Enabling lock display power-off service"

systemctl --user daemon-reload
systemctl --user enable --now lock-dpms-off.service

# ==================================================
# DONE
# ==================================================

echo
echo "=========================================="
echo " Environment setup complete"
echo "=========================================="
echo
echo "Log out and back in if your login shell"
echo "was changed to zsh."
