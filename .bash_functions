# Custom functions:

fprhost () {
# get fingerprint of host(s) prior to ssh
# 1st get host ip address: https://stackoverflow.com/questions/21336126
    a=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
    f=$(mktemp)
    ssh-keyscan "${1:-$a}" > "$f" 2>/dev/null
    ssh-keygen -lf "$f"
    rm -f "$f"
}

fprnet () {
# get fingerprints of any systems on 192.168.3.0/24 subnet
    f=$(mktemp)
    ssh-keyscan 192.168.3.{1..255} > "$f" 2>/dev/null
    ssh-keygen -lf "$f"
    rm -f "$f"
}

gethist () {
# save unique commands from ~/.bash_history
    awk '!x[$0]++' ~/.bash_history > ~/bash-history/"$(date +%F_%T)"
}

goup () {
# cd up n levels; allows for cd -; tests for valid number of levels
    i=${1:-1}
    max=$(pwd | awk -F/ '{print NF-2}')
    if [ "$i" -le 0 ] || [ "$i" -gt "$max" ]; then
        cd "$HOME" || exit
    else
        cd "$(printf '%0.s../' "$(seq 1 "$i")")" || exit
    fi
}

gpgfprfmt () {
# reformat gpg fingerprint with colons
    gpg -k "$1"
    printf '%s %s\n' 'colon formatted full fingerprint for' "$1"
    gpg -k --with-colons "$1" | grep fpr | sed 's/[fpr|:]//g;s/../&:/g;s/:$//g'
}

makehist () {
# create a file containing ALL unique commands in ~/bash-history directory
# source for awk command: https://stackoverflow.com/questions/11532157/
    sed 's/^[ ]*[0-9]\+[ ]*//' ~/bash-history/* | awk '!x[$0]++' > allhistory.txt
}

rccheck () {
# show uninstalled (rc) packages
    dpkg -l | grep ^rc | awk '{print $2}'
}

rcpurge () {
# purge uninstalled packages
    sudo apt-get remove --purge "$( dpkg -l | grep ^rc | awk '{print $2}' | tr '\n' ' ' )"
}

utc () {
# show time in UTC
    date -u | awk '{printf "%s %s\n", $4, $5 }'
}

