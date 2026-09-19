# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt AUTO_CD

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Better command-line editing
bindkey -e

# Useful aliases
# alias ll='ls -lah'
# alias la='ls -A'
# alias l='ls -CF'
alias ll='eza -lah --group-directories-first --icons=auto'
alias la='eza -a --group-directories-first --icons=auto'
alias l='eza --group-directories-first --icons=auto'
alias gs='git status'

#Searching in dotfiles command-line
dotfiles() {
  local file

  file=$(
    fd \
      --type f \
      --hidden \
      --exclude .git \
      . "$HOME/dotfiles" |
    fzf \
      --prompt="DOTFILES > " \
      --border \
      --reverse
  )

  [[ -n "$file" ]] && nvim "$file"
}

# fzf
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f /usr/share/fzf/shell/completion.zsh ] && source /usr/share/fzf/shell/completion.zsh

# terminal commands flags fzf tab
autoload -Uz compinit
compinit

source ~/.local/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no

# zoxide
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz colors
colors

# Make CMake always generate clangd's database
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

# PROMPT='%F{cyan}%~%f
# %F{green}❯%f '
