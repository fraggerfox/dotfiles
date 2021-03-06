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
if [ $(id -u) = "0" ]; then
        PS1="[%n@%m: %~]# "
else
        PS1="[%n@%m: %~]$ "
fi

# Fix the annoying lag between Esc and / in vi mode backward 
# command search.
KEYTIMEOUT=1 # 10ms for key sequences

vi-search-fix() {
zle vi-cmd-mode
zle .vi-history-search-backward
}

autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix

# Editor and Pager
PAGER=less
EDITOR=vi
export EDITOR
export PAGER

# set CVS remote shell command
CVS_RSH=ssh
export CVS_RSH
#export CVSROOT="anoncvs@anoncvs.NetBSD.org:/cvsroot"

# NetBSD's pkgsrc settings
PATH="$PATH:/usr/pkg/sbin:/usr/pkg/bin"
#PKG_PATH="ftp://ftp.NetBSD.org/pub/pkgsrc/packages/OPSYS/ARCH/VERSIONS/All/"
export PATH

# This is for remote sessions with tmux
#if ! { [ -n "$TMUX" ]; } then
#	tmux attach -d || tmux new
#fi

