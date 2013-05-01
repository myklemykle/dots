[ -f ~/.zsql ] && . ~/.zsql
alias cvsdiff="cvs diff 2>&1 | grep -v Diffing"
alias swsh="ssh gesine@swampthing"

# grep through source.
SG() { grep --exclude-dir .git --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude-dir cache --exclude-dir tmp -r "$*" . ; }

# same thing, but leave out the sql and xml files.
sg() { grep --exclude-dir .git --exclude \*.sql --exclude \*.xml --exclude \*.jp\*g --exclude \*.pdf --exclude \*.png --exclude \*.gif --exclude tags --exclude \*.po --exclude \*.pot --exclude-dir cache --exclude-dir tmp -r "$*" . ; }

# exhuberance!
[ -x "/usr/local/bin/ctags" ] && alias ctags="/usr/local/bin/ctags"
set tags=./tags;      

# zsh tweaks
unsetopt correct
unsetopt correctall

alias pear="/Applications/MAMP/bin/php/php5.4.4/bin/pear"
alias phing="/Applications/MAMP/bin/php/php5.4.4/bin/phing"
alias mamplogs="tail -f /Applications/MAMP/logs/*err*"

# bitch make me a sandwich
turn_out(){
  cat ~/.ssh/id_rsa.pub | ssh $* "mkdir .ssh; chmod 700 .ssh; cat >> .ssh/authorized_keys;"
}

# for Apache Tomcat:
export JAVA_HOME=/Library/Java/Home
export CATALINA_HOME=~/Documents/netxposure/tomcat/Home

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
