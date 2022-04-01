# Created by newuser for 5.8

#Export
export TERM=alacritty
export EDITOR=nvim

#Enable Colors
autoload -U colors && colors

#Enable History
HISTSIZE=2500
SAVEHIST=2500
HISTFILE=~/.histfile

#Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

#no beep
unsetopt BEEP

#pywal auto
var=$(grep file ~/.config/nitrogen/bg-saved.cfg | sed 's/file=//')
wal -q -i $var

#git info
autoload -Uz vcs_info && compinit
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '|%b|'

#alias
alias vim='nvim'

#PS
PS1='%F{green}%n@%m%f:%F{blue}[%~]%f%F{red}${vcs_info_msg_0_}%f >> '
PS2='> '
