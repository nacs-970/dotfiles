# Created by newuser for 5.8

#Export
export TERM=alacritty
export EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#Enable Colors
autoload -U colors && colors

#Set zsh history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

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
bindkey '^R' history-incremental-search-backward #reverse-i-search
bindkey '^H' backward-kill-word # ctrl + backspace
#bindkey '5~' kill-word # ctrl + del

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
alias vi='nvim'
alias feh='feh -g 1280x720 -z'
alias sourcez='source ~/.config/zsh/.zshrc'
#alias picom='picom --experimental-backends'
alias mpvg='mpv --player-operation-mode=pseudo-gui&disown'
alias wcrf='feh --bg-fill $(ls /media/d/Personal/Image/walls/* | shuf -n 1);source ~/.config/zsh/.zshrc' #feh
alias wcf='feh --bg-fill $(ls /media/d/Personal/Image/walls/*|sxiv -tio);source ~/.config/zsh/.zshrc;clear' #feh
alias wcrn='nitrogen --set-zoom-fill --save $(ls /media/d/Personal/Image/walls/* | shuf -n 1);source ~/.config/zsh/.zshrc;clear' #nitrogen
alias wcn='nitrogen --set-zoom-fill --save $(ls /media/d/Personal/Image/walls/*|sxiv -tio);source ~/.config/zsh/.zshrc;clear' #nitrogen
alias bls='betterlockscreen -u $(ls /media/d/Personal/Image/walls/*|sxiv -tio)'
alias sptdl='echo "URL > ";read spotdlurl;spotdl $spotdlurl --format m4a --output /media/d/Personal/Musik/Download'
alias sptdlc='spotdl "$(xclip -o -selection clipboard)" --format m4a --output /media/d/Personal/Musik/Download'
alias gitp='cat /media/d/Personal/Doc/git-token.txt|xclip -selection clipboard'
alias ls='ls -ah --color=auto --group-directories-first'
alias sxiv='sxiv -a'
alias cl='clear'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias grep='grep --color=auto'
alias camera-ptp='gio open "gphoto2://[$(gphoto2 --auto-detect | grep -Eo "usb[^ ]+")]";clear'

#pywal auto
wal -q -i "$(grep file ~/.config/nitrogen/bg-saved.cfg | sed 's/file=//')" #nitrogen
#wal -q -i $(grep feh ~/.fehbg |awk '{print $4}' | sed -e "s/'//g") #feh

clear
