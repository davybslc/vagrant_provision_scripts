## install_lamp script ##

# if apache2 does no exist
if [[ ! -f /etc/apache2/apache2.conf ]];
then

	## MySQL
	echo "mysql-server mysql-server/root_password password $mysql_password" | debconf-set-selections
	echo "mysql-server mysql-server/root_password_again password $mysql_password" | debconf-set-selections
	apt-get -y install mysql-server

	## Apache
	apt-get -y install apache2

	## PHP
	apt-get -y install php5 libapache2-mod-php5 php-apc php5-cli php5-mysql 

	## Install PHP pear
	apt-get -y install php-pear

	## Restart apache
	/etc/init.d/apache2 restart

	## Install PostFix
	debconf-set-selections \
		<<< "postfix postfix/mailname string $project_name.dev"
	debconf-set-selections \
		<<< "postfix postfix/main_mailer_type string 'Internet Site'"
	apt-get install -y postfix

else
	echo "LAMP stack already installed"
fi
