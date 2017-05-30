
####
# Related to NetXposure 
#
####

# for Apache Tomcat:
export JAVA_HOME=/Library/Java/Home
#export CATALINA_HOME=$IPDIR/..
alias dam_on="sudo $IPDIR/bin/startup.sh"
alias dam_off="sudo $IPDIR/bin/shutdown.sh"
alias dam_restart="sudo $IPDIR/bin/shutdown.sh; sleep 10; sudo $IPDIR/bin/startup.sh"

# # grab the latest DAM release from service:
# (obsolete; latest releases come from Jenkins now.)
# newdam(){
# 	#scp kropotkin.netx:/upgrades/latest/NetX-App-Latest.zip ~/Downloads &&
# 		#/netx/service/data/repository/Jenkins/Upgrades/develop
# 	if [ $1 ] 
# 	then
# 		TARGET=$1
# 	else
# 		TARGET="master"
# 	fi
# 	LATEST=`ssh mykle@service.netx.net "cd '/netx/service/data/repository/Jenkins/Upgrades/$TARGET/'; ls -t NetX*" | head -1`
# 	scp "mykle@service.netx.net:/netx/service/data/repository/Jenkins/Upgrades/$TARGET/$LATEST" ~/Downloads
# 		cd ~/Documents/netxposure/imageportal && { 
# 			unzip -o ~/Downloads/$LATEST ; 
# 			chmod 755 bin/*.sh # workaround for a bug
# 		}
# 		#dam_restart
# }

# install New Dam:
nd(){
	if [ ! -z $1 ] 
	then
		cd ~/Documents/netxposure/test_vbox
		./update.sh $1
		cd
	fi
}

# for Ant
export ANT_OPTS='-Xms1024m -Xmx1024m -XX:MaxPermSize=1024m'

# dev locations: now in k9.zsh

# X7 dev environment on/off
# (NOTE: this no longer works on ingot, because I run a virtual machine instead.)
x7on(){
	sudo echo "starting" # .. get password out of the way early
	cd $V8GIT
	mamp start
	sudo $IPDIR/bin/startup.sh
	sleep 3
	open -a Google\ Chrome $V8DEV_URL
	grunt dev
	grunt watch
}

x7off(){
	sudo $IPDIR/bin/shutdown.sh
	sleep 2 # dam_off doesn't block
	mamp stop
}

alias x7="cd $X7GIT/src"
	
# ultra-handy dirs
export CDPATH=".:$HOME/Documents/netxposure/gp4/products/:$HOME/Documents/netxposure:$HOME/Documents/netxposure/gp4"

