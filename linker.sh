#!/bin/sh

# link in all the dotfiles:

DOTS=`ls -a -1 | tail -n+3 | grep -v .git`
echo linking $DOTS
for i in $DOTS
do
  [ -f ~/$i ] || [ -f $i ] && ln $i ~/$i && echo linked $i
done
