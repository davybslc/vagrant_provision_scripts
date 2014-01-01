#!/usr/bin/env bash

## Vagrant Provisioning Shell Script ##

# These scripts are written for VirtualBox base box containing:
#    - Ubuntu 12.04
#    - OpenSSH
#    - "vagrant" user
#    - Vagrant "insecure keypair" installed.

# See http://docs.vagrantup.com/v2/boxes/base.html
# for more info about base box configuration.

## Portions of these scripts come from https://github.com/mauserrifle/vagrant-debian-shell


# Path to scripts on vagrant client vm
script_path='/vagrant/scripts' #required


# Configuration details
source $script_path/config.sh

# Before install script
source $script_path/install_before.sh

# Install LAMP stack (includes postfix)
source $script_path/install_lamp.sh

# Install PHPMyAdmin
source $script_path/install_phpmyadmin.sh

# Install XDebug
source $script_path/install_xdebug.sh

# Install PHPUnit
source $script_path/install_phpunit.sh

# After install script
source $script_path/install_after.sh


## Way to make a block comments in a shell script
# needs the single quote to work properly

## START Block Comment ##
: << 'end_of_comment'

--Stuff that gets commented out--

## END Block Comment ##
end_of_comment
