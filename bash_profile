DOTFILES=~/.dotfiles

source $DOTFILES/bash/aliases
source $DOTFILES/bash/completions
source $DOTFILES/bash/paths
source $DOTFILES/bash/config

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  . ~/.localrc
fi
