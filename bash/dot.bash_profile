# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# Remember a lot of commands
export HISTSIZE=500000

# CVS Stuff
export CVSEDITOR=vi
#CVSROOT=anoncvs@anoncvs.NetBSD.org:/cvsroot
export CVSROOT=fox@cvs.NetBSD.org:/cvsroot
export CVS_RSH=ssh-cvs  # Uses the custom CVS script refer to CVS folder for this.

export EDITOR=vi

set -o vi

export DISPLAY=:0.0

# Golang stuff
export GOROOT=d:\\dev\\tools\\go
export PATH=/cygdrive/d/dev/tools/go/bin:$PATH

# Erlang stuff
export ERLHOME=/cygdrive/d/dev/tools/erl
export PATH=/cygdrive/d/dev/tools/erl/bin:$PATH
