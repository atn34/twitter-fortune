#! /bin/sh

usage() {
    echo "usage: $0 <twitter_handle>"
}

if [ -z $1 ] ; then
    usage
    exit
fi

decode_entities() {
    sed 's/&amp;/\&/g' | sed 's/&lt;/</g' | sed 's/&gt;/>/g'
}

TWITTER_HANDLE=$1

curl -s http://greptweet.com/f/$TWITTER_HANDLE > /dev/null

curl -s http://greptweet.com/u/$TWITTER_HANDLE/tweets.txt \
    | cut -f3 -d'|' \
    | grep -v '\<RT\>\|\<http\|@' \
    | decode_entities \
    | awk "1; { print \"\t\t-- @$TWITTER_HANDLE\n%\"; }"
