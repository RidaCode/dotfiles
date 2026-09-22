#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TPM="$HOME/.tmux/plugins/tpm"
ZSH_PLUGIN_DIR="$HOME/.local/share/zsh/plugins"

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
  make \
  unzip \
  gawk \
  tree-sitter-cli \
  nodejs22 \
  nodejs22-npm \
  util-linux-user \
  gcc-c++ \
  clang-tools-extra \
  gdb \
  dotnet-sdk-10.0 \
  python3-neovim \
  zsh-autosuggestions \
  zsh-syntax-highlighting

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
# LAZYGIT
# ==================================================

echo "==> Installing Lazygit"

if ! command -v lazygit >/dev/null 2>&1; then
  sudo dnf copr enable -y dejan/lazygit
  sudo dnf install -y lazygit
else
  echo "Lazygit already installed"
fi

# ==================================================
# ZSH PLUGINS
# ==================================================

echo "==> Installing Zsh plugins"

mkdir -p "$ZSH_PLUGIN_DIR"

if [[ ! -d "$ZSH_PLUGIN_DIR/fzf-tab/.git" ]]; then
  git clone https://github.com/Aloxaf/fzf-tab \
    "$ZSH_PLUGIN_DIR/fzf-tab"
else
  echo "fzf-tab already installed"
  git -C "$ZSH_PLUGIN_DIR/fzf-tab" pull --ff-only
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
stow --restow lazygit
stow --restow clang-format
stow --restow clang-tidy

# ==================================================
# ZSH
# ==================================================

ZSH_PATH="$(command -v zsh)"
CURRENT_SHELL="$(getent passwd "$USER" | cut -d: -f7)"

if [[ "$CURRENT_SHELL" != "$ZSH_PATH" ]]; then
  echo "==> Setting zsh as login shell"
  sudo usermod --shell "$ZSH_PATH" "$USER"
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
# DONE
# ==================================================

echo
echo "=========================================="
echo " Environment setup complete"
echo "=========================================="
echo
echo "Restart your shell or log out and back in."
