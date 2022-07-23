typeset -U path PATH

# XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME="$HOME/.config"}

# Fixing paths
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_CONFIG_HOME"/zsh/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GOPATH="$XDG_DATA_HOME"/go
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc

# Disable less 
export LESSHISTFILE=-
