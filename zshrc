DOTFILES=~/dotfiles

. $DOTFILES/shared

. $DOTFILES/zsh/config
. $DOTFILES/zsh/aliases
. $DOTFILES/zsh/completion
. $DOTFILES/zsh/ruby

[[ -f ~/dotfiles-home/zshrc ]] && . ~/dotfiles-home/zshrc
[[ -f ~/dotfiles-work/zshrc ]] && . ~/dotfiles-work/zshrc
