autoload -U compinit
autoload -Uz vcs_info

compinit

# History settings
HISTFILE=~/.zsh_history
SAVEHIST=3000
HISTSIZE=3000
DIRSTACKSIZE=30

# zstyles
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '[%b%u%c]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Colours
local red="%{"$'\e[1;31m'"%}"
local RED="%{"$'\e[0;31m'"%}"
local cyan="%{"$'\e[1;36m'"%}"
local CYAN="%{"$'\e[0;36m'"%}"
local blue="%{"$'\e[1;34m'"%}"
local BLUE="%{"$'\e[0;34m'"%}"
local green="%{"$'\e[1;32m'"%}"
local GREEN="%{"$'\e[0;32m'"%}"
local magenta="%{"$'\e[1;35m'"%}"
local MAGENTA="%{"$'\e[0;35m'"%}"
local yellow="%{"$'\e[1;33m'"%}"
local YELLOW="%{"$'\e[0;33m'"%}"
local gray="%{"$'\e[1;30m'"%}"
local GRAY="%{"$'\e[0;37m'"%}"
local white="%{"$'\e[1;37m'"%}"
local NOCOLOR="%{"$'\e[0m'"%}"
local NEWLINE="%{"$'\e[80D'"%}"

# Prompt
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
}
export PS1="${green}%n@%m${NOCOLOR}:${blue}%~%1(v|%F${YELLOW}%1v%f|)${NOCOLOR}$ "
export PS2="%_> "
export RPS1=""

# Coloring commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Emacs key bindings
bindkey -e

# zsh options
setopt auto_cd
setopt auto_pushd
setopt correct
setopt nolistbeep
setopt list_packed

. ~/.bash_aliases
