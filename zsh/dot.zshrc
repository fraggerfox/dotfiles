# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fox/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Customizations by Fox

# This PS1
f [ $(id -u) = "0" ]; then
        PS1="[%n@%m: %~]# "
else
        PS1="[%n@%m: %~]$ "
fi

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# 10ms for key sequences
KEYTIMEOUT=1

# This is for remote sessions with tmux
#tmux attach -d || tmux new
