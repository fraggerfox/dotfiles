#       $NetBSD: dot.profile,v 1.26.12.1 2014/12/01 21:17:21 martin Exp $

export PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/pkg/sbin:/usr/pkg/bin
export PATH=${PATH}:/usr/X11R7/bin:/usr/X11R6/bin:/usr/local/sbin:/usr/local/bin

# Uncomment the following line(s) to install binary packages
# from ftp.NetBSD.org via pkg_add.  (See also pkg_install.conf)
#export PKG_PATH=ftp://ftp.NetBSD.org/pub/pkgsrc/packages/NetBSD/$(uname -m)/7.1/All
#export PKG_PATH="${PKG_PATH};ftp://ftp.NetBSD.org/pub/pkgsrc/packages/NetBSD/$(uname -m)/6.0/All"

export BLOCKSIZE=1k
export HOST="$(hostname)"
export HISTSIZE=50000
export HISTFILE=$HOME/.ksh_history

if [ -x /usr/bin/tset ]; then
	eval $(tset -sQrm 'unknown:?unknown')
fi

# file permissions: rwxr-xr-x
umask 022
#ulimit -c 0

# Set some of the common shell variables
export ENV=$HOME/.shrc
export EDITOR=vi
export PAGER=less

# some useful aliases
alias c='clear'
alias h='fc -l'
alias j=jobs
alias m=$PAGER
alias ll='ls -laFo'
alias l='ls -l'
alias g='egrep -i'
alias ls='ls -F'

# # be paranoid
# alias cp='cp -ip'
# alias mv='mv -i'
# alias rm='rm -i'

# Do not display in 'su -' case
if [ -z "$SU_FROM" ] && [ -z `id -u` ]; then
	echo "We recommend that you create a non-root account and use su(1) for root access."
fi

# Set the CVS variables
export CVSEDITOR=vi
export CVSROOT=anoncvs@anoncvs.NetBSD.org:/cvsroot
export CVS_RSH=ssh

# Sometimes on terminal reset, the backspace needs to be rebound
stty erase '^?'