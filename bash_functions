# Woods function definitions:

# go up faster; source: https://www.reddit.com/r/bash/comments/baf3ki/faster_cd/
#..() { i=${1:-1}; while ((i--)); do cd ..; done; }
# go up faster by Woods
goup () { i=${1:-1}; cd $(printf "%0.s../" $(seq 1 $i)); };

# get fingerprint of host(s) prior to ssh
sshfpr () { f=$(mktemp); ssh-keyscan ${1:-192.168.3.10} > $f 2>/dev/null; ssh-keygen -lf $f; rm -f $f; };
sshnetfpr () { f=$(mktemp); ssh-keyscan 192.168.3.{1..255} > $f 2>/dev/null; ssh-keygen -lf $f; rm -f $f; };

# reformat gpg fingerprint with colons
gpgfprfmt () { gpg -k --with-colons $1 | grep fpr | sed 's/[fpr|:]//g;s/../&:/g;s/:$//g';};

