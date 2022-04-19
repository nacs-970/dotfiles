# Created by newuser for 5.8

#Export
export TERM=alacritty
export EDITOR=nvim
export PATH=/home/nacs/.local/bin:$PATH

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

#Bindkey | showkey -a to make sure
bindkey "^[[H" beginning-of-line #Home
bindkey "^[[F" end-of-line #End
bindkey "^[[5~" up-history #Page-up
bindkey "^[[6~" down-history #Page-down

#Plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#git info
autoload -Uz vcs_info && compinit
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '|%b|'

#PS
PS1='%F{green}%n@%m%f:%F{blue}[%~]%f%F{red}${vcs_info_msg_0_}%f >> '
PS2='> '

#alias
alias vim='nvim'
alias rsn='redshift -P -O 2500'
alias rsr='redshift -P -x'
alias feh='feh -g 1280x720 -z'
#alias spotify='LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify'
alias ls='ls -lah'

#pywal auto
wal -q -i $(grep file ~/.config/nitrogen/bg-saved.cfg | sed 's/file=//')
