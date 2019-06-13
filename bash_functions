# Custom functions:

cdup () {
# go up n levels; allows for cd -
# improved over: https://www.reddit.com/r/bash/comments/baf3ki/faster_cd/
    i=${1:-1}
    cd $(printf "%0.s../" $(seq 1 $i))
}

goup () {
# Test for valid number of levels
    i=${1:-1}
    max=$(pwd | awk -F/ '{print NF-2}')
    if [ "$i" -le 0 ] || [ "$i" -gt "$max" ]; then
        cd $HOME
    else
        cd $(printf '%0.s../' $(seq 1 $i))
    fi
}

fprhost () {
# get fingerprint of host(s) prior to ssh
    f=$(mktemp)
    ssh-keyscan ${1:-192.168.3.10} > $f 2>/dev/null
    ssh-keygen -lf $f
    rm -f $f
}

fprnet () {
# get fingerprints of any systems on 192.168.3.0/24 subnet
    f=$(mktemp)
    ssh-keyscan 192.168.3.{1..255} > $f 2>/dev/null
    ssh-keygen -lf $f
    rm -f $f
}

gpgfprfmt () {
# reformat gpg fingerprint with colons
    gpg -k $1
    printf '%s %s\n' 'colon formatted full fingerprint for' $1
    gpg -k --with-colons $1 | grep fpr | sed 's/[fpr|:]//g;s/../&:/g;s/:$//g'
}

makehist () {
# create a file containing unique commands in ~/bash-history
# source for awk command: https://stackoverflow.com/questions/11532157/
    awk '!x[$0]++' ~/bash-history/* | sed 's/^[ ]*[0-9]\+[ ]*//' > allhistory.txt
}
