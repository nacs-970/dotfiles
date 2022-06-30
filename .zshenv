typeset -U path PATH
# ZDOTDIR paths
export ZDOTDIR=$HOME/.config/zsh

# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME="$HOME/.config"}

# Fixing paths
export HISTFILE="$XDG_CONFIG_HOME"/zsh/history

# Disable less 
export LESSHISTFILE=-
