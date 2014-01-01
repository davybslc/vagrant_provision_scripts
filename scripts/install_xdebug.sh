
# search for xdebug
xdebug_path=$(find / -name xdebug.so)

# if it is not installed
if [[ -z $xdebug_path ]];
then
	# install xdebug
	pecl install xdebug

    # search for xdebug install path
    xdebug_path=$(find / -name xdebug.so)

	# append xdebug heading to php.ini
	echo ' ' >> /etc/php5/apache2/php.ini
	echo '[xdebug]' >> /etc/php5/apache2/php.ini

	# append xdebug location to php.ini
	echo "zend_extension=$xdebug_path" >> /etc/php5/apache2/php.ini

	# append remote enabled to php.ini
	echo 'xdebug.remote_enable=1' >> /etc/php5/apache2/php.ini

	# append remote enabled to php.ini
	echo "xdebug.remote_host=$vm_host_ip" >> /etc/php5/apache2/php.ini

	# Restart apache
	/etc/init.d/apache2 restart
else
	echo "XDebug already installed"
fi
