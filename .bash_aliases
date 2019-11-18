# Custom aliases

alias catfuncs='if [ -f ~/.bash_functions ]; then cat ~/.bash_functions; fi'
alias catsmart='if [ -e ~/smart_summary.txt ]; then clear && cat ~/smart_summary.txt; fi'
alias checkup='sudo apt update && apt list --upgradable'
alias cleanhis="history | sed 's/^[ ]*[0-9]\+[ ]*//'"
alias dirsize='du -sh */ 2>/dev/null | sort -h'
alias dotbashrc='. ~/.bashrc'
alias getsmart='~/bin/cron-smart-status'
alias getwanip='printf '%s' "WAN IPv4 address is: "; curl ifconfig.es'
alias hdtemps='sudo hddtemp -q /dev/sd{a..z} 2>/dev/null'
alias isupgrade='do-release-upgrade -c'
alias launchvm='bash -c "virtualbox >/dev/null 2>/dev/null &"'
alias lh='ls -1t | head -1'
alias l.='ls -d .* --color=auto'
alias l.l='ls -ld .* --color=auto'
alias pingmo='~/bin/ping-monet'
alias pingnet='~/bin/netcheck'
alias ppalists='apt policy | grep ppa'
alias rotatevid='ffmpeg -i in.mp4 -vf "transpose=2" out.mp4'
alias simsyncSD1='rsync -n -avrhiO --delete --progress --stats ~/.gnupg/ /media/woods/cryptSD1/dot_gnupg/'
alias snooze='sudo systemctl suspend'
alias wx='curl wttr.in'

# raspberrypi specific
alias gettemp='sudo vcgencmd measure_temp' # only works on Raspberry Pi
