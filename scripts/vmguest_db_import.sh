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

