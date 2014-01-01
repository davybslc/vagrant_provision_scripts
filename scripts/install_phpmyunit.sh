## Install PHPUnit ##

# If PHPUnit does not exist
if [[ ! -f /usr/bin/phpunit ]];
then
	
	# Setup pear to get PHPUnit
	pear config-set auto_discover 1
	
	# Install PHPUnit
	pear install pear.phpunit.de/PHPUnit

else
	echo "PHPUnit already installed"
fi



