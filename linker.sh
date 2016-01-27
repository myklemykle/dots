#!/bin/zsh 

# install oh-my-zsh and janus:

# TODO: fix the linking line to create symbolic links
echo sorry, not working yet; exit

[ -d ~/.oh-my-zsh ] || git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

pushd ~
[ -d ~/.vim ] || curl -Lo- https://bit.ly/janus-bootstrap | bash
popd

# link in all the dotfiles:

DOTS=`ls -ad -1 .??* | grep -v '^.git$'`		
echo linking $DOTS
for i in $DOTS
do
	# TODO: this is the line to fix.
  [ -f ~/$i ] || [ -f $i ] && ln -f $i ~/$i && echo linked $i
done

# link in ohmyzsh custom stuff.
OHCUSS=~/.oh-my-zsh/custom   # ohmyzsh customization dir.
[ -d "$OHCUSS" ] && ln ohmyzsh_custom/* "$OHCUSS"
