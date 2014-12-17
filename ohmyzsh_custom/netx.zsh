
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
newdam(){
	#scp kropotkin.netx:/upgrades/latest/NetX-App-Latest.zip ~/Downloads &&
	LATEST=`ssh mykle@service.netx.net "cd '/netx/service/data/repository/Jenkins/Upgrades/master/'; ls -t NetX*" | head -1`
	scp "mykle@service.netx.net:/netx/service/data/repository/Jenkins/Upgrades/master/$LATEST" ~/Downloads
		cd ~/Documents/netxposure/imageportal && { 
			unzip -o ~/Downloads/$LATEST ; 
			chmod 755 bin/*.sh # workaround for a bug
		}
		#dam_restart
}

# for Ant
export ANT_OPTS='-Xms1024m -Xmx1024m -XX:MaxPermSize=1024m'

# X7 dev environment on/off
x7on(){
	sudo echo "starting" # .. get password out of the way early
	cd /Users/myklehansen/Documents/netxposure/html5
	mamp start
	sudo ~/Documents/netxposure/imageportal/bin/startup.sh
	sleep 3
	open -a Google\ Chrome http://localhost/core/dev
	grunt dev
	grunt watch
}

x7off(){
	sudo ~/Documents/netxposure/imageportal/bin/shutdown.sh
	sleep 2 # dam_off doesn't block
	mamp stop
}

alias x7="cd; cd html5/src"
	
# ultra-handy dirs
export CDPATH=".:$HOME/Documents/netxposure/gp4/products/:$HOME/Documents/netxposure:$HOME/Documents/netxposure/gp4"

