# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# use zsh
if [ -f /bin/zsh ]; then
    exec /bin/zsh
fi

# load git-completion.bash for Mac OS X
if [ -f /usr/local/git/share/git-completion ]; then
  . /usr/local/git/share/git-completion
fi

# don't put duplicate lines in the history.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
HISTCONTROL=ignoreboth

# show executed time in the history.
HISTTIMEFORMAT='%D %T '

# append to the history file.
shopt -s histappend

# set history length.
HISTSIZE=1000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files.
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt.
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# read colour setting.
PROMPT_COLOUR=32
if [ -f ~/.bash_colour ]; then
    . ~/.bash_colour
fi

# show git branch for prompt.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\[\1\]/'
}

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;${PROMPT_COLOUR}m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[00;33m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# read defined aliases.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# add ~/bin directory to PATH variable.
PATH=${PATH}:~/bin

# select an editor to edit git commit
GIT_EDITOR=vim

# select default editor
EDITOR=vim
