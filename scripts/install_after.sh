## install_after script ##


## Import SQL Database

	# if database does not already exist and $db_path is set
	# and there is a file called $project_name.sql
	if [[ ! -d "/var/lib/mysql/$project_name" ]] && \
	   [[ -n $db_path ]] && \
	   [[ -f "$db_path/$project_name.sql" ]];
	then

		# Import db into mysql
		mysql \
		  --user='root' \
		  --password=$mysql_password \
		  < "$db_path/$project_name.sql"

		# For reference
		# Below is the command used create the dump file
		# mysqldump \
		#  --user='root' \
		#  --password=$mysql_password \
		#  --databases $project_name \
		#  > "$db_path/$project_name.sql"

	elif [[ -d "/var/lib/mysql/$project_name" ]];
	then
		echo "Database $project_name already exists"
	fi


## Add vagrant user to www-data group

    if [[ -f /etc/apache2/apache2.conf ]];
    then
		adduser vagrant www-data
	fi

## Change Apache Admin Email (email displayed in webserver error messages)

    # if $admin_email is set and apache is installed and default.original does not exist
    if [[ -n $admin_email ]] && \
       [[ -f /etc/apache2/apache2.conf ]] && \
       [[ ! -f /etc/apache2/sites-available/default.original ]];
    then

        # Make a copy of the original sites config
        cp /etc/apache2/sites-available/default /etc/apache2/sites-available/default.original

        # change the email address
        sed \
            "s/ServerAdmin webmaster\@localhost/ServerAdmin $admin_email/" \
            < /etc/apache2/sites-available/default.original \
            > /etc/apache2/sites-available/default

        # Restart apache
        /etc/init.d/apache2 restart

	# if admin email has already been changed
    elif [[ -f /etc/apache2/sites-available/default.original ]];
    then
        echo "Admin email displayed in apache server errors set to $admin_email"
	
	# if $admin_email is set, but apache has not been set up
    elif [[ -n $admin_email ]] && \
    	 [[ ! -f /etc/apache2/apache2.conf  ]];
    then
        echo "Admin email displayed in apache server errors"
        echo "CANNOT BE SET because apache is not installed"
    fi


## Link /vagrant to /var/www so files synced from host VM show up in guest VM web root
	rm -rf /var/www
	ln -fs /vagrant /var/www


## enable mod_rewrite
	a2enmod rewrite


## Create phpinfo
	echo '<?php phpinfo();' > /vagrant/phpinfo.php
	chmod 755 /vagrant/phpinfo.php


## remove apt-get packages
	apt-get -y clean


## Uncomplicated Firewall (UFW)
# use this if your development environment is not secure

# # Get ufw status
# 	ufw_status=$(ufw status | grep Status)
# 
# # if ufw is not active
# 	if [[ $ufw_status != 'Status: active' ]];
# 	then
# 		ufw allow 22
# 		ufw allow 80
# 		echo 'y' | sudo ufw enable
# 	elif  [[ $ufw_status == 'Status: active' ]];
# 	then
# 		echo "UFW is active"
# 	fi


