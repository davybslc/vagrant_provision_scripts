#!/usr/bin/env bash

## VM Host Hose file update script
# This script adds an entry for the vm to the hosts file on recient versions of osx.


# make sure we are running as root
if [ "$UID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


## Get existing variables

    source ./config.sh


## Extract IP from Vagrantfile

    #search for uncommented line exists in Vagrentfile
    vagfileline=$(grep '^[ \t]*config.vm.network[ \t]*:private_network,[ \t]*ip:'  ../Vagrantfile)

    # if the string is not empty
    if [[ -n $vagfileline ]];
    then

        # extract the IP address
        vm_ip=$( echo $vagfileline | grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' )

        # search for ip in hosts
        hosts_result=$(grep "$vm_ip" /private/etc/hosts)

         if [[ -n $hosts_result ]];
         then

            ip_assigned_to=$( echo "$hosts_result" | grep -o '[a-zA-Z0-9-]*\.[a-zA-Z0-9]*$' )

            echo "IP Address already assigned to $ip_assigned_to"

         else

            ## !!! figure out how to fix all occurances. this only gets the first one in a line
            project_name_hyph=$(echo "$project_name" | sed 's/_/-/g' )

            echo "$vm_ip  $project_name_hyph.dev" >> /private/etc/hosts

            echo "$vm_ip  $project_name_hyph.dev added to hosts file"
         fi

    else

       echo "Mapping not added to hosts: Unable to find IP address in Vagrantfile."

    fi

