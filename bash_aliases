# Custom aliases
alias checkup='sudo apt update && apt list --upgradable'
alias cleanhis="history | sed 's/^[ ]*[0-9]\+[ ]*//'"
alias dirsize='du -sh */|sort -h'
alias gethist='awk '\''!x[$0]++'\'' $HOME/.bash_history > $HOME/bash-history/$(date +%F_%T)'
alias getsmart='$HOME/bin/cron-smart-status'
alias getwanip='printf '%s' "WAN IPv4 address is: "; curl ifconfig.es'
alias gitbashrc='cp $HOME/.bashrc $HOME/github/dotfiles/bashrc'
alias gitalias='cp $HOME/.bash_aliases $HOME/github/dotfiles/bash_aliases'
alias gitfuncs='cp $HOME/.bash_functions $HOME/github/dotfiles/bash_functions'
alias hdtemps='sudo hddtemp -q /dev/sd{a..z} 2>/dev/null'
alias isupgrade='do-release-upgrade -c'
alias launchvm='bash -c "virtualbox >/dev/null 2>/dev/null &"'
alias lh='ls -1t | head -1'
alias l.='ls -d .* --color=auto'
alias l.l='ls -ld .* --color=auto'
alias pingmo='$HOME/bin/netcheck'
alias ppalists='apt policy | grep ppa'
alias rccheck='dpkg -l | grep ^rc | awk '\''{print $2}'\'''
alias rcpurge='sudo apt-get remove --purge $(dpkg -l | grep ^rc | awk '\''{print $2}'\'' | tr '\''\n'\'' '\'' '\'')'
alias rotatevid='ffmpeg -i in.mp4 -vf "transpose=2" out.mp4'
alias simsyncSD1='rsync -n -avrhiO --delete --progress --stats $HOME/.gnupg/ /media/woods/cryptSD1/dot_gnupg/'
alias snooze='sudo systemctl suspend'
alias UTC='date -u'
alias utc='date -u | awk '\''{printf "%s %s\n", $4, $5}'\'' '
alias wx='curl wttr.in'
