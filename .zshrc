#set -x
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jreese"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx vi-mode)

DISABLE_AUTO_UPDATE="true"  #http://stackoverflow.com/questions/11378607/oh-my-zsh-disable-would-you-like-to-check-for-updates-prompt
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# TODO: PATH stuff should probably be in custom as much as possible ...
PATH=`paste -d ':' -s - << EOF
/usr/local/bin
/usr/local/opt/ruby/bin
/usr/local/CrossPack-AVR/bin
/opt/local/bin
/opt/local/sbin
/usr/local/bin
/usr/local/sbin
$HOME/bin
$HOME/Documents/Perl\ Scripts
/usr/bin
/bin
/usr/sbin
/sbin
/usr/local/share/npm/bin
/Applications/MAMP/bin
/Applications/MAMP/Library/bin
/Applications/MAMP/bin/php5/bin
$HOME/.cargo/bin
EOF`
	### took these out ... cross-compiler for Bela (never got working)
	#/usr/local/linaro/arm-linux-gnueabihf/bin
	#/usr/local/linaro/tools
	#$HOME/Documents/bela/xcompiling/bela/scripts
export PATH

# zsh tweaks i want on all hosts:
unsetopt correct      # no autocorrection
unsetopt correctall
DISABLE_AUTO_TITLE="true"
#set +x

# various auto-installers (macports etc) that want to add
# something to my profile like to add it here:
[ -f ./.zprofile ] && . ./.zprofile
