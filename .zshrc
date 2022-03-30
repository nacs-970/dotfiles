# Created by newuser for 5.8

#Enable Colors
autoload -U colors && colors

#Enable History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

#Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

#no beep
unsetopt BEEP

#git info
autoload -Uz vcs_info
precmd() { vcs_info }
#PS
PS1="%n@%~|$> ${vcs_info_msg_0_}"
