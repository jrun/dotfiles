DOTFILES=~/dotfiles

. $DOTFILES/shared
. $DOTFILES/zsh/config
. $DOTFILES/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -f ~/dotfiles-home/zshrc ]] && . ~/dotfiles-home/zshrc
[[ -f ~/dotfiles-work/zshrc ]] && . ~/dotfiles-work/zshrc

# remove duplicates
typeset -U path cdpath manpath fpath
