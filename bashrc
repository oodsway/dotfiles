# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Execute vte.sh for Tilix startup
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# woods personal alias list
alias checkup='sudo apt update && apt list --upgradable'
alias cliclock='while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-11));echo -e "\e[32m $(date +%T) \e[39m";tput rc;done &'
alias dirsize='du -sh */|sort -h'
alias fahstart='sudo /etc/init.d/FAHClient start'
alias fahstop='sudo /etc/init.d/FAHClient stop'
alias getbashrc='cat /home/woods/.bashrc > /home/woods/bashrc_files/_mybashrc_$(date +%F_%T)'
alias gethistory='history > /home/woods/bash-history/$(date +%F_%T)'
alias getsmart='/home/woods/bin/cron-smart-status'
alias getwanip='printf '%s' "WAN IPv4 address is: "; curl ifconfig.es'
alias hdtemps='sudo hddtemp -q /dev/sd{a..z} 2>/dev/null'
alias isupgrade='do-release-upgrade -c'
alias launchvm='bash -c "virtualbox >/dev/null 2>/dev/null &"'
alias lh='ls -1t | head -1'
alias l.='ls -d .* --color=auto'
alias l.l='ls -ld .* --color=auto'
alias pingmo='/home/woods/bin/netcheck'
alias ppalists='apt policy | grep ppa'
alias rccheck='dpkg -l | grep ^rc | awk '\''{print $2}'\'''
alias rcpurge='sudo apt-get remove --purge $(dpkg -l | grep ^rc | awk '\''{print $2}'\'' | tr '\''\n'\'' '\'' '\'')'
alias rotatevideo='ffmpeg -i in.mp4 -vf "transpose=2" out.mp4'
alias russianroulette='[ $[ $RANDOM%6 ] == 0 ] && echo "bang" || echo "click"'
alias simsyncSD1='rsync -n -avrhiO --delete --progress --stats /home/woods/.gnupg/ /media/woods/cryptSD1/dot_gnupg/'
alias snooze='sudo systemctl suspend'
alias cdup='cdup () { i=${1:-1}; cd $(printf "%0.s../" $(seq 1 $i));}; cdup $1'
alias UTC='date -u'
alias utc='date -u | awk '\''{printf "%s %s\n", $4, $5}'\'' '
alias wakecloud='wakeonlan 00:1a:a0:7b:22:7b'
alias wakekidzmac='wakeonlan 6c:40:08:8c:62:54'
alias wakemomini='wakeonlan a8:60:b6:20:76:97'
alias wakeunitylt='wakeonlan 00:23:26:fb:b3:75'
alias wx='curl wttr.in'

# Function definitions:
# go up faster; source: https://www.reddit.com/r/bash/comments/baf3ki/faster_cd/
#..() { i=${1:-1}; while ((i--)); do cd ..; done; }
# go up faster by Woods
goup () { i=${1:-1}; cd $(printf "%0.s../" $(seq 1 $i)); };

# get fingerprint of host(s) prior to ssh
sshfpr () { f=$(mktemp); ssh-keyscan ${1:-192.168.3.10} > $f 2>/dev/null; ssh-keygen -lf $f; rm -f $f; };
sshnetfpr () { f=$(mktemp); ssh-keyscan 192.168.3.{1..255} > $f 2>/dev/null; ssh-keygen -lf $f; rm -f $f; };

# reformat gpg fingerprint with colons
gpgfprfmt () { gpg -k --with-colons $1 | grep fpr | sed 's/[fpr|:]//g;s/../&:/g;s/:$//g';};


