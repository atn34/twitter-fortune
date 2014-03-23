# Twitter Fortune #

Generates a fortune file of the tweets of a given twitter handle

Discards retweets, links, and tweets containing '@' (tweets directed
at specific users aren't very fortune-worthy in my opinion)

## Usage ##
```
$ ./twitter-fortune.sh <twitter-handle> > fortune-file
$ strfile fortune-file
$ fortune fortune-file
```

You might also want to move the files to your fortune directory.
Use `$ fortune -f` to find your fortune directory.

## Acknowledgements ##
Thanks to [greptweet](https://github.com/kaihendry/Greptweet)
