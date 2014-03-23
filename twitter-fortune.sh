#! /bin/sh

usage() {
    echo "usage: $0 <twitter_handle>"
}

if [ -z $1 ] ; then
    usage
    exit
fi

TWITTER_HANDLE=$1

curl -s http://greptweet.com/f/$TWITTER_HANDLE > /dev/null

curl -s http://greptweet.com/u/$TWITTER_HANDLE/tweets.txt \
    | cut -f3 -d'|' \
    | grep -v '\<RT\>\|\<http\|@' \
    | perl -MHTML::Entities -pe'binmode STDOUT, ":utf8"; HTML::Entities::decode_entities($_)' \
    | awk "1; { print \"\t\t-- @$TWITTER_HANDLE\n%\"; }"
