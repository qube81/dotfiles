# Load my dotfiles
# ~/.extra includes private settings
for file in ~/.{extra,aliases,exports}; do
	[ -r "$file" ] && source "$file"
done
unset file


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host"   ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh 

# for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# git autocomplete
# wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
source ~/git-completion.bash
