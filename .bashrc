# Load my dotfiles
# ~/.extra includes private settings
for file in ~/.{extra,aliases,exports}; do
    [ -r "$file" ] && source "$file"
done
unset file


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host"   ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# git autocomplete
if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
    source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
fi
if [ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
fi


# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
