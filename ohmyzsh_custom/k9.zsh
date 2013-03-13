alias swsh="ssh gesine@swampthing"
alias cvsdiff="cvs diff 2>&1 | grep -v Diffing"
alias cvsgrep="grep --exclude-dir .cvs --exclude \*.cvs\*"
alias svngrep="grep --exclude-dir .svn --exclude \*.svn\*"
srcgrep() { grep --exclude-dir .cvs --exclude \*.cvs\* --exclude-dir .svn --exclude \*.svn\* -r "$*" . ;  }
alias ctags="/usr/local/bin/ctags"
unsetopt correct
unsetopt correctall
alias pear="/Applications/MAMP/bin/php/php5.4.4/bin/pear"
alias phing="/Applications/MAMP/bin/php/php5.4.4/bin/phing"

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
