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

alias vi="vim"

alias rm='rm -i'
alias rmt='rmtrash'
alias cp='cp -i'
alias mv='mv -i'

alias cdiff='colordiff -u'

alias dw='colordiff -u --strip-trailing-cr'
alias pwd='pwd -P'

alias bye='sudo shutdown -h now'
alias h="history"
alias x="exit"
alias tree="tree -Na"

alias slog="script -a ~/Desktop/log-`date +%Y%m%d%H%M%S`.txt"
alias ajax="curl --header \"X-Requested-With: XMLHttpRequest\""

alias imgsize="mdls -name kMDItemPixelWidth -name kMDItemPixelHeight"
alias img='qlmanage -p "$@" >& /dev/null'

alias brew!="brew update; brew upgrade; brew cleanup"

# workspace shortcut with peco
alias ws='cd $(ghq list -p | peco)'

# open GitHub pull request page for current branch
alias pr='hub browse -- pull/$(git rev-parse --abbrev-ref HEAD)'

# ~/.ssh/config shoutcut with peco
function ssp() {
  #SSH=$(grep "^\s*Host " ~/.ssh/config | sed s/"[\s ]*Host "// | grep -v "^\*$" | sort | peco)
  SSH=$((cat ~/.ssh/config ~/.ssh/conf.d/hosts/*.conf) | grep "^\s*Host " | sed s/"[\s ]*Host "// | sort | peco)
  ssh $SSH
}