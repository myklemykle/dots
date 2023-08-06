####
# Generic software development stuff -- for all my work macs
#
####

# my special mysql zsh tools
[ -f ~/.zsql ] && . ~/.zsql

# CVS == obsolete
# alias cvsdiff="cvs diff 2>&1 | grep -v Diffing"

# grep through source.
SG() { grep --exclude-dir .git --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude-dir cache --exclude-dir tmp -r -- "$*" . ; }

# same thing, but leave out the sql and xml files.
sg() { grep --color=always --exclude-dir .git --exclude \*.sql --exclude \*.xml --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude \*.min.js --exclude-dir cache --exclude-dir tmp -r -- "$*" . | egrep -v '.{500}'; }

# same thing but leave out colorization -- handy for piping into another grep
sgbw() { grep --color=never --exclude-dir .git --exclude \*.sql --exclude \*.xml --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude \*.min.js --exclude-dir cache --exclude-dir tmp -r -- "$*" . | egrep -v '.{500}'; }

# same thing, but give me just a list of matching files -- handy for piping into other commands
SGF() { SG $* | cut -f1 -d: | sort -u }
sgf() { sgbw $* | cut -f1 -d: | sort -u }

# edit all matching files in vim:

sgvi() {
  #cut -f1 -d: | sort -u | xargs vi
  #SGVI_FILES=`sg $* | cut -f1 -d: | sort -u | paste -s -`
  #echo vi $SGVI_FILES
  #vi $SGVI_FILES
  vi `sgbw $* | cut -f1 -d':' | sort -u | paste -s -`
}

# grep history
alias hgr="history | grep"

# recursively remove files matching a pattern -- use with severe caution!
rrm() {
  find . -name $* -print | xargs rm -v
}

# find some f'ing file

fff() {
  find . -name $* -print
}

# global search/replace in files -- do not use! you will die!
gsp() {
  sgf $1 | xargs perl -pi.bak -e "s|$1|$2|g"
}

# grep the output of ps
psg() {
	ps -ef | grep $1
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

# bitch make me a sandwich!
turn_out(){
  cat ~/.ssh/id_rsa.pub | ssh $* "mkdir .ssh; chmod 700 .ssh; cat >> .ssh/authorized_keys;"
}

#   ########
#   # color terminals for ssh sessions or whatever
#   #
#
# if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
#   function ssh {
#     typeset -A namemap
#
#       # a map of hostnames to names of styles defined in Terminal.app Settings pane
#     namemap=(
#       example1.com source
#       example2.com cvs
#     )
#
#     for key in ${(k)namemap};
#     do
#       if echo "$@" | grep "$key" 
#       then
#         STYLE=${namemap[$key]}
#         OLDSTYLE=`SetTerminalStyle -s "${STYLE}" -t "$@" -c`
#         break
#       fi
#     done
#
#     /usr/bin/ssh "$@"
#       # restore
#     SetTerminalStyle -s "$OLDSTYLE"
#   }
# fi

# for jsctags (javascript tagging thing that uses node.js) -- not really working?
export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

# give me all the filez!!!
ulimit -n 1000

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
