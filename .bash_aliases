###############################################################
# Settings for ssh.
###############################################################

# Change ssh port 2222.
# Enable ssh-agent.
alias ssh='ssh -p 2222 -A'
alias scp='scp -P 2222'

# When use ssh over port 22.
alias ssh22='ssh -p 22 -A'
alias scp22='scp -P 22'

###############################################################
# Basic command shortcuts.
###############################################################

# Show some detail informations.
alias ll='ls -l'
# Show all files.
alias la='ls -A'
# Add color and slash for files.
alias l='ls -CF'
# Show a confirm message when copy file.
alias cp='cp -i'
# Show a confirm message when remove file.
alias rm='rm -i'
# Show a human readable messages when use df command.
alias df='df -h'
# Show a human readable messages when use du command.
alias du='du -h'
# Replace vi vim.
alias vi='vim'
# Shortcut history command as h.
alias h='history'
# Shortcut grep command as g.
alias g='grep'
# Show free memory using megabyte scale.
alias free='free -m'


###############################################################
# Shortcuts
###############################################################

# open argument-list as tab.
alias vi='vi -p'
alias vim='vim -p'
# Shortcut to edit the hosts file.
alias hosts-vi='sudo vi /etc/hosts'
# Shortcuts for Python
alias python-clean-cache="find ./ -name '*.pyc' -exec rm {} \;"
# Shortcuts for cakephp.
alias cake-clean-cache="find ./tmp/cache -type f -name 'cake_*' -exec rm {} \;"
alias cake-fixtures="cd ./tests/fixtures"
alias cake-cases="cd ./tests/cases"
alias cake-models="cd ./models"
alias cake-behaviors="cd ./models/behaviors"
alias cake-datasources="cd ./models/datasorces"
alias cake-controllers="cd ./controllers"
alias cake-components="cd ./controllers/components"
alias cake-shells="cd ./vendors/shells"
# Find out of coding standards for CakePHP.
alias cake-checkstyle="phpcs --standard=Cake --ignore=vendors,plugins,tests --extensions=php ./"
# Find out of coding standards for Zend.
alias zend-checkstyle="phpcs --standard=Zend --ignore=vendors,plugins,tests --extensions=php ./"
# Find out of coding standards for Bergmenn.
alias bergmenn-checkstyle="phpcs --standard=Bergmenn --ignore=vendors,plugins,tests,config --extensions=php ./"
# Shortcut to log commands.
alias logging-commands="script `date +%Y%m%d%H%M%S`.log"
# grep for line encoding.
alias grep-crlf='grep -UIlr ""'
# Shortcuts for git.
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"

###############################################################
# Functions
###############################################################

# Shortcut to edit the program and this test file togather for CakePHP.
cake-vi() {
  if [ ${#} -ne 1 ]; then
    echo 'You must set the path to the program that you want to edit the first argument.';
    return
  fi

  FULLDIR=`pwd`
  NAME=`echo ${1} | sed 's/.\+\/\(.\+\?\).php/\1/g'`
  DIR=`dirname ${1}`

  vi ${FULLDIR}/${1} ${FULLDIR}/tests/cases/${DIR}/${NAME}*.test.php
}

# ssh-copy-id
ssh-copy-id() {
  if [ ${#} -ne 1 ]; then
    echo 'You must set the remote host name the first argument.';
    return
  fi
  cat .ssh/id_rsa.pub | ssh ${1} 'cat >> .ssh/authorized_keys'
}

# generates random password.
random-numeric() {
  cat /dev/urandom | tr -dc '0-9' | fold -w ${1} | head
}
random-alphanumeric() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1} | head
}
