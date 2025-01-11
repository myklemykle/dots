####
# Generic software development stuff (macos version) -- for all my work macs
#
####

# my special mysql zsh tools
[ -f ~/.zsql ] && . ~/.zsql

# grep through source.
SG() { egrep --exclude-dir .git --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude-dir cache --exclude-dir tmp -r -- "$*" . ; }

# same thing, but leave out sql and xml files, .o and .elf files
sg() { egrep --color=always --exclude-dir .cache --exclude-dir .git --exclude \*.sql --exclude \*.xml --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude \*.min.js --exclude \*.o --exclude \*.elf --exclude-dir cache --exclude-dir tmp --exclude-dir contracts/rust/target -r -- "$*" . | egrep -v '.{255}'; }

# same thing but leave out colorization -- handy for piping into another grep
sgbw() { egrep --color=never --exclude-dir .git --exclude \*.sql --exclude \*.xml --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude \*.min.js --exclude-dir cache --exclude-dir tmp -r -- "$*" . | egrep -v '.{255}'; }

# same thing, but give me just a list of matching files -- handy for piping into other commands
SGF() { SG $* | cut -f1 -d: | sort -u }
sgf() { sgbw $* | cut -f1 -d: | sort -u }

# or just do it the git way:
unalias gg
gg() { git grep $* }

# VIM setup:
#
# if I have a custom vim installed, I probably want to use it.
if [ -f /usr/local/bin/vim ]
then
	__VIM=/usr/local/bin/vim
else 
	__VIM=`which vim`
fi

# Detect OS X Terminal and mess with tabs
if [ "$TERM" = 'xterm-256color' ]
then
	function vim(){
		if [ -n "$1" ]
		then
			tabname `basename $1`
		else 
			tabname "vim"
		fi
		$__VIM "$@"
		tabname 
	}
	alias vi=vim
else
	alias vim=$__VIM
	alias vi=$__VIM
fi

# edit all matching files in vim:

sgvi() {
	vi `sgbw $* | cut -f1 -d':' | sort -u | paste -s -`
}

# find files by pattern and edit them in vim:
fvi() {
	vi `fff $*`
}

# grep history
alias hgr="history | egrep"

# recursively remove files matching a pattern -- use with severe caution!
rrm() {
	find . -name $* -print | xargs rm -v
}

# find some f'ing file

fff() {
	find . -name $* -print
}

# global search/replace in files -- do not use! you will die!
unalias gsr  # too many git aliases, really
gsr() {
	sgf $1 | xargs perl -pi.bak -e "s|$1|$2|g"
}
# same but only touch files in current git repo:
ggsr() {
	gg -o $1 | cut -f1 -d: | sort -u | xargs perl -pi.bak -e "s|$1|$2|g"
}

# same thing for files under git:
gitsr() {
	git grep -l $1 | xargs sed -i '' -e "s/$1/$2/g"
}

# grep the output of ps
psg() {
	ps -ef | egrep $1
}

# exhuberance!
[ -x "/usr/local/bin/ctags" ] && alias ctags="/usr/local/bin/ctags"
set tags=./tags;      

# zsh tweaks
unsetopt correct
unsetopt correctall

# if MAMP is installed ...
# handy dirs
alias pear="/Applications/MAMP/bin/php/php5.4.4/bin/pear"
alias phing="/Applications/MAMP/bin/php/php5.4.4/bin/phing"
alias mamplogs="tail -f /Applications/MAMP/logs/*err*"

# bich make me a sandwich
turn_out(){
	cat ~/.ssh/id_rsa.pub | ssh $* 'if [ ! -d .ssh ] ; then mkdir .ssh; chmod 700 .ssh; fi; cat >> .ssh/authorized_keys;'
}

# label windows and tabs in xterm/terminal/whatever:
tabname() {
	printf "\e]1;$1\a"
}

winname() {
	printf "\e]2;$1\a"
}


# for jsctags (javascript tagging thing that uses node.js) -- not really working?
export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

# give me all the filez!!!
ulimit -n 1000

# down with rmcup!
export LESS="-X -R"

# winname not a thing in 10.8?
# function for setting terminal titles in OSX
function winname {
  printf "\033]0;%s\007" "$1"
}

# Faust (as installed by macports) puts its libraries in a place it can't find them!  Bleh.
export FAUST_LIB_PATH=/opt/local/share/faust

# 2018.11.22:
# ZSH broke a thing in 5.2(?), that OS X doesn't fix, so basically
# dragging a folder doesn't escape the pasted path anymore, unless
# one does this:
unset zle_bracketed_paste
