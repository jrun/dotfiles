DOTFILES=~/.dotfiles

. $DOTFILES/zsh/config
. $DOTFILES/zsh/aliases
. $DOTFILES/zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
