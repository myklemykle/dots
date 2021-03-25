nearview() { 
	if [ -n "$CONTRACT_NAME" -a -f "./.env" ] 
		. ./.env

	if [ -n "$CONTRACT_NAME" ] 
	then
		npx near view $CONTRACT_NAME $*
	else
		echo ". ./.env to set project variables"
		return 1
	fi
}

nearcall() {
	if [ -n "$CONTRACT_NAME" -a -f "./.env" ] 
		. ./.env

	if [ -n "$CONTRACT_NAME" ] 
	then
		npx near call --accountId $ADMIN_ID $CONTRACT_NAME $*
	else
		echo ". ./.env to set project variables"
		return 1
	fi
}

