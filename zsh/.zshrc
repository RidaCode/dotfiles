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

# Better command-line editing
bindkey -e

# Useful aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'

# fzf
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh
[ -f /usr/share/fzf/shell/completion.zsh ] && source /usr/share/fzf/shell/completion.zsh

# zoxide
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -Uz colors
colors

PROMPT='%F{cyan}%~%f
%F{green}❯%f '
