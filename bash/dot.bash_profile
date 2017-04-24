# This PS1
# PS1="[%n@%m: %~]$ "

set -o vi

# CVS Stuff
CVSEDITOR=vi
CVSROOT=anoncvs@anoncvs.NetBSD.org:/cvsroot
CVS_RSH=ssh
export CVSEDITOR
export CVSROOT
export CVS_RSH

export EDITOR=vi

export DISPLAY=:0.0

export GOROOT=d:\\dev\\tools\\go

export PATH=/cygdrive/d/dev/tools/go/bin:$PATH
