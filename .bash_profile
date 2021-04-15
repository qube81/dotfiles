# cache result of brew --prefix
BREW_PREFIX=$(brew --prefix)

export BASH_SILENCE_DEPRECATION_WARNING=1

export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export HISTCONTROL=ignoreboth

export PATH=$PATH:$HOME/bin

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Global Composer
export PATH=$PATH:$HOME/.composer/vendor/bin/


# brew install bash-completion
if [ -f ${BREW_PREFIX}/etc/bash_completion ]; then
	. ${BREW_PREFIX}/etc/bash_completion
fi

# rbenv
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# phpenv
export PATH=$HOME/.phpenv/bin:$PATH
eval "$(phpenv init -)"

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
fi

# gcloud
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"


# git completion
source ~/.git-completion.bash
source ~/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\[\e[1;36m\][ \t \W$(__git_ps1)]\[\e[00m\]\n\$ '

# LESS
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export LESS='-gj10 --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --LONG-PROMPT'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
export PAGER=less

# node
BREW_PREFIX_NVM=/usr/local/opt/nvm
export NVM_DIR="$HOME/.nvm"
[ -s ${BREW_PREFIX_NVM}/nvm.sh ] && . ${BREW_PREFIX_NVM}/nvm.sh  # This loads nvm
[ -s ${BREW_PREFIX_NVM}/etc/bash_completion.d/nvm ] && . ${BREW_PREFIX_NVM}/etc/bash_completion.d/nvm

# ========================================== #

# load .bashrc
test -r ~/.bashrc && . ~/.bashrc