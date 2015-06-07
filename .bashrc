# ~/.extra includes private settings
for file in ~/.{extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# aliases

alias ~="cd ~"
alias ..="cd .."

alias e="echo"
alias o="open ."
alias d="cd ~/Desktop"

alias ll="ls -lhpa"
alias la="ls -a"

# List only directories
alias ld='ll | grep "^d"'

alias grep="grep --color=auto"
alias sed="gsed"

alias firefox="open -a Firefox"
alias safari="open -a Safari"
alias chrome="open -a Google\ Chrome"
alias vi="vim"

alias rm='rmtrash'
alias cp='cp -i'
alias mv='mv -i'
alias diff='colordiff -u'
alias dw='colordiff -u --strip-trailing-cr'
alias pwd='pwd -P'

alias apachectl='sudo apachectl'

alias bye='sudo shutdown -h now'
alias h="history"
alias x="exit"

# IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# generate password (installed via homebrew)
alias pwgen="pwgen -1"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

alias f="find . -type f -print | grep $1"
alias tree="tree -a"

# git
alias tig="tig --all"

# for github utility "hub", from homebrew
eval "$(hub alias -s)"

# workspace short
alias ws='ghq look $(ghq list | peco)'
alias cdv='cd $(vagrant global-status | egrep "^[a-z0-9]{7}" | tr -s " " | cut -f 5 -d" " | peco)'

function ghqco() {
	ghs $@ | peco | awk '{print $1}' | ghq import
}

function ghqrm () {
  ghq list --full-path | peco | xargs rm -r
}

#SSH shoutcut
function ssp() {
	SSH=$(grep "^\s*Host " ~/.ssh/config | sed s/"[\s ]*Host "// | grep -v "^\*$" | sort | peco)
	ssh $SSH
}

alias ajax="curl --header \"X-Requested-With: XMLHttpRequest\""

alias brew!="ansible-playbook -i ~/.mac/ansible/hosts -vv ~/.mac/ansible/brew.yml"

alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"
alias img='qlmanage -p "$@" >& /dev/null'

#exports
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
#export PS1='[\t \u@\h \W$(__git_ps1)]\$ '

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
export PS1='\[\e[1;36m\][ \t \W$(__git_ps1)]\[\e[00m\] \$ '

export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH # for Homebrew
export PATH=$PATH:$HOME/.rbenv/bin

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# composer
export PATH="~/.composer/vendor/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host"   ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
