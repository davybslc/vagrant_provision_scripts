#!/usr/bin/env bash

## VM Host Hose file update script
# This script removes the entry for the vm from the hosts file on recient versions of osx.


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

            sed -i '.bak' "/$vm_ip/d" /private/etc/hosts
            echo "$vm_ip entry removed from hosts"
         else

            echo "hosts file does not contain an entry for $vm_ip"

         fi

    else

       echo "Mapping not added to hosts: Unable to find IP address in Vagrantfile."

    fi

