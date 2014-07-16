# Load my dotfiles
# ~/.extra includes private settings
for file in ~/.{extra,aliases,exports}; do
	[ -r "$file" ] && source "$file"
done
unset file


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host"   ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh 

# git autocomplete
# wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
source ~/git-etc/git-completion.bash

# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
