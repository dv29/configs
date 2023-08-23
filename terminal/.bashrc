# Install bash-git-prompt

# getting the system information
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)
      machine="UNKNOWN:${unameOut}"
      echo ${machine}
esac

if [[ ! -d ~/.bash-git-prompt ]]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi

# if [[ ! -d ~/.bash_it ]]; then
#   git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
#   . ~/.bash_it/install.sh
# fi
#
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

# bash settings 
set -o vi

if [ $machine = 'Mac' ]; then
    alias ls='ls -G'
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias g="git"
alias gb="git branch"
alias gs="git status"
alias ga="git add ."
alias gcom="git commit -m"
alias gcomp="git commit --amend --no-edit"
alias gsh="git stash"
alias gcm="git checkout master"
alias gcnb="git checkout -b "
alias gcb="git checkout "
alias gd="git diff --cached"
alias gdc="git diff --check"
alias gk="gitk"
alias gpl="git pull" 
alias gpu="git push"
alias grm="git rebase -i origin/master"
alias grc="git rebase --continue"
alias gd="git diff HEAD"
alias gr="git reset"
alias reinitpack="rm -rf node_modules/ package-lock.json && npm i"
alias gm="git mergetool -t vimdiff"
alias xclip="xclip -sel clip"

function gpb() {
  ## Git push branch to remote origin
  REMOTE=${1:-origin}
  git push -u $REMOTE $(git rev-parse --abbrev-ref HEAD)
}

function grb() {
  git rebase -i HEAD~$1
}

function search() {
  grep -rin "$1" --exclude-dir={node_modules,assets,.next} ./$2
}

alias nrb="npm run build"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
