# Custom .bashrc functions:
# Date: 2019-07-04
# Comment: fixed sourcing errors with explicit function definition

function fprhost () {
# get fingerprint of host(s) prior to ssh
# 1st get host ip address: https://stackoverflow.com/questions/21336126
    local a=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
    local f=$(mktemp)
    ssh-keyscan "${1:-$a}" > "$f" 2>/dev/null
    ssh-keygen -lf "$f"
    rm -f "$f"
}

function fprnet () {
# get fingerprints of any systems on 192.168.3.0/24 subnet
    local f=$(mktemp)
    ssh-keyscan 192.168.3.{1..255} > "$f" 2>/dev/null
    ssh-keygen -lf "$f"
    rm -f "$f"
}

function gethist () {
# save unique commands from ~/.bash_history
# awk source-1: https://stackoverflow.com/questions/11532157/
# awk source-2: https://stackoverflow.com/questions/1444406/
    if [ -d ~/bash-history ]; then
        awk '!x[$0]++' ~/.bash_history > ~/bash-history/"$(date +%F_%T)"
    else
        printf "bash-history directory not found\n"
    fi
}

function goup () {
# cd up n levels; allows for cd -; tests for valid number of levels
    local i=${1:-1}
    max=$(pwd | awk -F/ '{print NF-2}')
    if [ "$i" -le 0 ] || [ "$i" -gt "$max" ]; then
        cd "$HOME" || exit
    else
        cd "$( printf '%0.s../' $(seq 1 "$i") )" || exit
    fi
}

function gpgfprfmt () {
# reformat gpg fingerprint with colons
    gpg -k "$1"
    printf '%s %s\n' 'colon formatted full fingerprint for' "$1"
    gpg -k --with-colons "$1" | grep fpr | sed 's/[fpr|:]//g;s/../&:/g;s/:$//g'
}

function makehist () {
# create a file containing ALL unique commands in ~/bash-history directory
# awk source-1: https://stackoverflow.com/questions/11532157/
# awk source-2: https://stackoverflow.com/questions/1444406/
    if [ -d ~/bash-history ]; then
        cd "$HOME"
        sed 's/^[ ]*[0-9]\+[ ]*//' ~/bash-history/* | \
        awk '!x[$0]++' > ~/allhistory.txt
    else
        printf "bash-history directory not found\n"
    fi
}

function rccheck () {
# show uninstalled (rc) packages
    dpkg -l | grep ^rc | awk '{print $2}'
}

function rcpurge () {
# purge uninstalled packages
    sudo apt-get remove --purge "$(dpkg -l | grep ^rc | awk '{print $2}' | tr '\n' ' ')"
}

function shofuncs () {
    if [ -f ~/.bash_functions ]; then
        grep -E '^function' ~/.bash_functions
    fi
}

function utc () {
# show time in UTC
    date -u | awk '{printf "%s %s\n", $4, $5 }'
}
