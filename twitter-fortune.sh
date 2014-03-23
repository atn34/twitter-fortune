#! /bin/sh

usage() {
    echo "usage: $0 <twitter_handle>"
}

if [ -z $1 ] ; then
    usage
    exit
fi

TWITTER_HANDLE=$1

curl -s http://greptweet.com/u/$TWITTER_HANDLE/tweets.txt \
    | grep -v '\<RT\>\|\<http\|@' \
    | cut -f3 -d'|' \
    | awk "1; { print \"\t\t-- @$TWITTER_HANDLE\n%\"; }"
