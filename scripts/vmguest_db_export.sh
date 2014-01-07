#!/usr/bin/env bash

## SQL Database Export

# make sure we are running as root
if [ "$UID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


# Path to scripts on vagrant client vm
script_path='/vagrant/scripts' #required

# Configuration details
source $script_path/config.sh

# get the date
date=$(date +"%Y-%m-%d_%k:%m:%S")


# if database exists and $db_path is set
if [[ -d "/var/lib/mysql/$project_name" ]] && \
   [[ -n $db_path ]];
then

    # For Reference
    # Import db into mysql
    # mysql \
    #   --user='root' \
    #   --password=$mysql_password \
    #   < "$db_path/$project_name.sql"

    # create a sql database dump file
    mysqldump \
      --user='root' \
      --password=$mysql_password \
      --databases $project_name \
      > "$db_path/$project_name$date.sql"


    if [[ -f "$db_path/$project_name.sql" ]];
    then
        rm "$db_path/$project_name.sql"
    fi

    cp "$db_path/$project_name$date.sql" "$db_path/$project_name.sql"

elif  [[ ! -n $db_path ]];
then
    echo '$db_path variable not set. Database dump not created.'
fi

