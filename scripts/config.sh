## Shell Script Configuration Details ##

# Name of the project. Used for: mysql database name, postfix mailname, 
project_name='my_project' #required

# Mysql Root Password
mysql_password='password' #required

# Package repository used by apt (in etc/apt/sources.list)
# comment it out to use default repository
ubuntu_mirror='mirrors.example.com' 

# Timezone used to dispaly date/time info. Server clock is set to UTC
# comment it out if you don't want to use it
time_zone='US/Mountain' 

# path to sql dump of the database on the guest VM.
# comment it out if you do not want to install a database from sql dump
db_path='/vagrant/db' 

# email address displayed on apache server errors
# comment it out if you don't want to use it
admin_email='me@example.com'

# IP address of the VM host in the VM network, used in xdebug config
# comment it out if you are not installing xdebug
vm_host_ip='192.168.42.1' #required for xdebug install
