#!/bin/zsh 

# install oh-my-zsh and janus:

echo sorry, not working yet; exit

[ -d ~/.oh-my-zsh ] || git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
pushd ~
[ -d ~/.vim ] || curl -Lo- https://bit.ly/janus-bootstrap | bash
popd

# link in all the dotfiles:

DOTS=`ls -ad -1 .??* | tail -n+3 | grep -v .git`		# FAILING ... rethink.
echo linking $DOTS
for i in $DOTS
do
  [ -f ~/$i ] || [ -f $i ] && ln $i ~/$i && echo linked $i
done

# todo: link in ohmyzsh custom stuff.
