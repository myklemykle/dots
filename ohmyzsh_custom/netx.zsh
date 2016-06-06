
####
# Related to NetXposure 
#
####

# for Apache Tomcat:
export JAVA_HOME=/Library/Java/Home
#export CATALINA_HOME=~/Documents/netxposure/tomcat/Home
alias dam_on="sudo ~/Documents/netxposure/imageportal/bin/startup.sh"
alias dam_off="sudo ~/Documents/netxposure/imageportal/bin/shutdown.sh"
alias dam_restart="sudo ~/Documents/netxposure/imageportal/bin/shutdown.sh; sleep 10; sudo ~/Documents/netxposure/imageportal/bin/startup.sh"

# grab the latest DAM release from service:
newdam(){
	#scp kropotkin.netx:/upgrades/latest/NetX-App-Latest.zip ~/Downloads &&
		#/netx/service/data/repository/Jenkins/Upgrades/develop
	if [ $1 ] 
	then
		TARGET=$1
	else
		TARGET="master"
	fi
	LATEST=`ssh mykle@service.netx.net "cd '/netx/service/data/repository/Jenkins/Upgrades/$TARGET/'; ls -t NetX*" | head -1`
	scp "mykle@service.netx.net:/netx/service/data/repository/Jenkins/Upgrades/$TARGET/$LATEST" ~/Downloads
		cd ~/Documents/netxposure/imageportal && { 
			unzip -o ~/Downloads/$LATEST ; 
			chmod 755 bin/*.sh # workaround for a bug
		}
		#dam_restart
}

# for Ant
export ANT_OPTS='-Xms1024m -Xmx1024m -XX:MaxPermSize=1024m'

# dev locations:
export X7GIT="/Users/myklehansen/Documents/netxposure/html5"
export X7DEV_URL="http://localhost/core/dev"
export V8GIT="/Users/myklehansen/Documents/netxposure/v8"
export V8DEV_URL="http://localhost/v8"

# X7 dev environment on/off
# (NOTE: this no longer works on ingot, because I run a virtual machine instead.)
x7on(){
	sudo echo "starting" # .. get password out of the way early
	cd $X7DEV
	mamp start
	sudo ~/Documents/netxposure/imageportal/bin/startup.sh
	sleep 3
	open -a Google\ Chrome $X7DEV_URL
	grunt dev
	grunt watch
}

x7off(){
	sudo ~/Documents/netxposure/imageportal/bin/shutdown.sh
	sleep 2 # dam_off doesn't block
	mamp stop
}

alias x7="cd $X7GIT/src"
	
# ultra-handy dirs
export CDPATH=".:$HOME/Documents/netxposure/gp4/products/:$HOME/Documents/netxposure:$HOME/Documents/netxposure/gp4"

