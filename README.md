# dotfiles

My Fedora development environment.

## Managed configs

- Zsh
- Git
- tmux
- Neovim / LazyVim
- Starship

- Power management helper
  - Never suspends automatically
  - Turns the display off when the session locks
  - Used with KDE lid-close action set to `Lock screen`

## What the installer does

`install.sh` will:

- Install the base CLI tools
- Install Starship
- Stow all managed dotfiles
- Set zsh as the login shell
- Install TPM
- Install tmux plugins declared in `.tmux.conf`

## Install

Clone the repo:

```bash
git clone git@github.com:RidaCode/dotfiles.git ~/dotfiles
```
