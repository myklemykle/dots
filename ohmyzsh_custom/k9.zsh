[ -f ~/.zsql ] && . ~/.zsql
alias cvsdiff="cvs diff 2>&1 | grep -v Diffing"
alias swsh="ssh gesine@swampthing"

# grep through source.
SG() { grep --exclude-dir .git --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude-dir cache --exclude-dir tmp -r "$*" . ; }

# same thing, but leave out the sql and xml files.
sg() { grep --color=always --exclude-dir .git --exclude \*.sql --exclude \*.xml --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude \*.min.js --exclude-dir cache --exclude-dir tmp -r "$*" . | egrep -v '.{500}'; }
sgbw() { grep --color=never --exclude-dir .git --exclude \*.sql --exclude \*.xml --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude \*.min.js --exclude-dir cache --exclude-dir tmp -r "$*" . | egrep -v '.{500}'; }

# same thing, but give me just a list of matching files
SGF() { SG $* | cut -f1 -d: | sort -u }
sgf() { sgbw $* | cut -f1 -d: | sort -u }

# for piping the output of one of those directly into a vim edit list:

sgvi() {
  #cut -f1 -d: | sort -u | xargs vi
  #SGVI_FILES=`sg $* | cut -f1 -d: | sort -u | paste -s -`
  #echo vi $SGVI_FILES
  #vi $SGVI_FILES
  vi `sgbw $* | cut -f1 -d':' | sort -u | paste -s -`
}

# grep history
alias hgr="history | grep"

# recursively remove files matching a pattern -- use with severe caution
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

# X7 dev environment on/off
x7on(){
	sudo echo "starting" # .. get password out of the way early
	cd /Users/mykle/Documents/netxposure/html5
	mamp start
	sudo ~/Documents/netxposure/tomcat/imageportal/bin/startup.sh
	sleep 3
	open -a Google\ Chrome http://localhost/core/dev
	grunt dev
	grunt watch
}

x7off(){
	sudo ~/Documents/netxposure/tomcat/imageportal/bin/shutdown.sh
	sleep 2 # dam_off doesn't block
	mamp stop
}

alias x7="cd; cd html5/src"
	
# exhuberance!
[ -x "/usr/local/bin/ctags" ] && alias ctags="/usr/local/bin/ctags"
set tags=./tags;      

# zsh tweaks
unsetopt correct
unsetopt correctall

# handy dirs
alias pear="/Applications/MAMP/bin/php/php5.4.4/bin/pear"
alias phing="/Applications/MAMP/bin/php/php5.4.4/bin/phing"
alias mamplogs="tail -f /Applications/MAMP/logs/*err*"

# ultra-handy dirs
export CDPATH=".:$HOME/Documents/netxposure/gp4/products/:$HOME/Documents/netxposure:$HOME/Documents/netxposure/gp4"

# bitch make me a sandwich
turn_out(){
  cat ~/.ssh/id_rsa.pub | ssh $* "mkdir .ssh; chmod 700 .ssh; cat >> .ssh/authorized_keys;"
}

# for Apache Tomcat:
export JAVA_HOME=/Library/Java/Home
export CATALINA_HOME=~/Documents/netxposure/tomcat/Home
alias dam_on="sudo ~/Documents/netxposure/tomcat/imageportal/bin/startup.sh"
alias dam_off="sudo ~/Documents/netxposure/tomcat/imageportal/bin/shutdown.sh"
alias dam_restart="sudo ~/Documents/netxposure/tomcat/imageportal/bin/shutdown.sh; sleep 10; sudo ~/Documents/netxposure/tomcat/imageportal/bin/startup.sh"
newdam(){
	#scp kropotkin.netx:/upgrades/latest/NetX-App-Latest.zip ~/Downloads &&
	LATEST=`ssh service.netx.net "cd '/netx/service/data/repository/Jenkins/Upgrades/master/'; ls -t NetX*" | head -1`
	scp "service.netx.net:/netx/service/data/repository/Jenkins/Upgrades/master/$LATEST" ~/Downloads
		cd ~/Documents/netxposure/tomcat/imageportal && { 
			unzip -o ~/Downloads/$LATEST ; 
			chmod 755 bin/*.sh # workaround for a bug
		}
		#dam_restart
}

# for Ant
export ANT_OPTS='-Xms1024m -Xmx1024m -XX:MaxPermSize=1024m'

  ########
  # color terminals for ssh sessions or whatever
  #

if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
  function ssh {
    typeset -A namemap

      # a map of hostnames to names of styles defined in Terminal.app Settings pane
    namemap=(
      cuttysark.netx.net poachedlive 
      poachedjobs.com poachedlive 
      poachedjs.netx.net poachedstaging
      git.netx source
      subversion.netx source
      doby.netx source
      luna.netx cvs
    )

    for key in ${(k)namemap};
    do
      if echo "$@" | grep "$key" 
      then
        STYLE=${namemap[$key]}
        OLDSTYLE=`SetTerminalStyle -s "${STYLE}" -t "$@" -c`
        break
      fi
    done

    /usr/bin/ssh "$@"
      # restore
    SetTerminalStyle -s "$OLDSTYLE"
  }
fi

# for jsctags (javascript tagging thing that uses node.js)
export NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

# give me all the filez
ulimit -n 1000
