
# Vagrant Provisioning Shell Scripts for Ubuntu

These scripts are written for VirtualBox base box containing:
  * Ubuntu 12.04 64 bit
  * OpenSSH
  * "vagrant" user
  * Vagrant "insecure keypair" installed.

See <http://docs.vagrantup.com/v2/boxes/base.html> and <http://docs.vagrantup.com/v2/virtualbox/boxes.html> for more info about base box configuration.  [This](https://github.com/fespinoza/checklist_and_guides/wiki/Creating-a-vagrant-base-box-for-ubuntu-12.04-32bit-server) guide was also helpful

These scripts are based on <https://github.com/mauserrifle/vagrant-debian-shell>.

`Vagrantfile` is included for reference.

`/scripts/provision.sh` is the file called by `Vagrantfile` and controls what scripts are executed

`/scripts/config.sh` contains all of the cofigurable variables. See comments in that file for explanations

`/scripts/install_before.sh` provides the ability to change Ubuntu repositories, time zone, and runs `apt-get update` and `apt-get upgrade` if they have not already been run that day

`/scripts/install_lamp.sh` installs mysql, php, apache2 and postfix. See the script for details.

`/scripts/install_phpmyadmin.sh`, `/scripts/install_phpmyunit.sh`, and `/scripts/install_xdebug.sh` are all self explanitory.

`/scripts/install_after.sh` provides the ability to import a mysql database dump, change the apache admin email address as well as other functions.

`/scripts/vmhost_host_add.sh` and `/scripts/vmhost_host_remove.sh`
