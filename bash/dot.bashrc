# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
# Remember a lot of commands
export HISTSIZE=500000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

force_colored_prompt=yes

#alias ls='ls --color=auto -F'
alias ls='ls -F'
alias emacs='emacs -nw'
#alias rm='rm -i' 
#alias cp='cp -i'

#Default Editor
export EDITOR='vi'

export PS1='[\u@\h: ${PWD}]\$ '

set -o vi

[ -n "$WINDOWID" ] && transset-df -i $WINDOWID 0.9 >/dev/null

# Set the locale to UTF-8
export LC_CTYPE="en_US.UTF-8"

#tmux attach -d || tmux new

# Allow the user to set the title.
function title {
   PROMPT_COMMAND="echo -ne \"\033]0;$1 (on $HOSTNAME)\007\""
}

title mintty
