# dotfiles

My Fedora development environment, managed with GNU Stow.

Designed for Fedora Linux and Fedora WSL.

## Managed configs

- Zsh
- Git
- tmux
- Neovim
- Starship
- Lazygit
- clang-format
- clang-tidy

## What the installer does

`install.sh` bootstraps the development environment and can be safely rerun.

It will:

- Install core CLI tools
- Install the C++ development toolchain
- Install .NET 10 for C# development
- Install Neovim dependencies
- Install Zsh plugins
- Install Starship
- Install Lazygit
- Stow all managed dotfiles
- Set Zsh as the login shell
- Install TPM
- Install tmux plugins declared in `.tmux.conf`

## Core tools

The installer includes tools such as:

- Git
- GNU Stow
- Zsh
- tmux
- Neovim
- ripgrep
- fd
- fzf
- zoxide
- eza
- curl
- wget
- wl-clipboard
- Node.js / npm
- Tree-sitter CLI
- make
- unzip
- gawk

## C++

The installer sets up:

- GCC / `g++`
- `clangd`
- `clang-format`
- `clang-tidy`
- GDB

The repository also manages:

```text
~/.clang-format
~/.clang-tidy
```

## C# / .NET

The installer installs:

```text
.NET SDK 10
```

Neovim's Mason configuration manages development tools such as:

- Roslyn Language Server
- CSharpier

`~/.dotnet/tools` is automatically added to `PATH`.

## Zsh

The installer installs:

- zsh-autosuggestions
- zsh-syntax-highlighting
- fzf-tab

The `.zshrc` also configures:

- fzf
- zoxide
- Starship
- useful aliases
- dotfiles search
- a simple `compile` command for LearnCpp exercises

## tmux

TPM is installed automatically.

Configured plugins include:

- `RidaCode/tmux-simple-manager`
- `tmux-plugins/tmux-resurrect`
- `tmux-plugins/tmux-continuum`

Sessions are periodically saved and restored across reboots.

## Neovim

Neovim manages most editor-specific language tooling through Mason.

System-level tools such as `clangd`, `clang-format`, `clang-tidy`, and GDB are installed by `install.sh`.

## Install

### 1. Clone the repository

This repository is private, so GitHub SSH authentication must already be configured on the machine.

```bash
git clone git@github.com:RidaCode/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Run the installer

```bash
./install.sh
```

The installer may ask for your `sudo` password while installing system packages.

### 3. Restart your shell

After the installer finishes, restart the terminal or log out and back in.

You can also start Zsh immediately with:

```bash
exec zsh
```

## Updating

Pull the latest changes:

```bash
cd ~/dotfiles
git pull
```

Then rerun:

```bash
./install.sh
```

The installer is intended to be idempotent, so rerunning it will update or reuse existing components where possible.

## Structure

```text
dotfiles/
├── clang-format/
├── clang-tidy/
├── git/
├── lazygit/
├── nvim/
├── starship/
├── tmux/
├── zsh/
├── install.sh
└── README.md
```

Each configuration directory follows the layout expected by GNU Stow and is linked into `$HOME` by the installer.
