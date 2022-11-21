# Created by newuser for 5.8

#Export
export TERM=alacritty
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

#Enable Colors
autoload -U colors && colors

#Enable History
HISTSIZE=2500
SAVEHIST=2500

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
#PS1='%F{green}%n@%m%f:%F{blue}[%~]%f%F{red}${vcs_info_msg_0_}%f >> ' # $USER@$HOST:[$PWD] >>
PS1='%F{green}%n%f:%F{blue}[%~]%f%F{red}${vcs_info_msg_0_}%f >> ' # $USER:[$PWD] >>
PS2='> '

#alias
alias vim='nvim'
alias feh='feh -g 1280x720 -z'
alias sourcez='source ~/.config/zsh/.zshrc'
#alias picom='picom --experimental-backends'
alias mpvg='mpv --player-operation-mode=pseudo-gui'
alias wcrf='feh --bg-fill $(ls /media/d/Personal/Image/walls/* | shuf -n 1);source ~/.config/zsh/.zshrc' #feh
alias wcrn='nitrogen --set-zoom-fill --save $(ls /media/d/Personal/Image/walls/* | shuf -n 1);source ~/.config/zsh/.zshrc;clear' #nitrogen
alias wcf='feh --bg-fill $(ls /media/d/Personal/Image/walls/*|sxiv -tio);source ~/.config/zsh/.zshrc;clear' #feh
alias wcn='nitrogen --set-zoom-fill --save $(ls /media/d/Personal/Image/walls/*|sxiv -tio);source ~/.config/zsh/.zshrc;clear' #nitrogen
alias bls='betterlockscreen -u $(ls /media/d/Personal/Image/walls/*|sxiv -tio)'
alias sptdl='echo "URL > ";read spotdlurl;spotdl $spotdlurl --of m4a -o /media/d/Personal/Musik/Download'
alias sptdlc='spotdl $(xclip -o -selection clipboard) --of m4a -o /media/d/Personal/Musik/Download'
alias gitp='cat /media/d/Personal/Doc/git-token.txt|xclip -selection clipboard'
alias ls='ls -ah --color=auto --group-directories-first'
alias sxiv='sxiv -a'
alias cl='clear'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias grep='grep --color=auto'

#pywal auto
wal -q -i $(grep file ~/.config/nitrogen/bg-saved.cfg | sed 's/file=//') #nitrogen
#wal -q -i $(grep feh ~/.fehbg |awk '{print $4}' | sed -e "s/'//g") #feh
