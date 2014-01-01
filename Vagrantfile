# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "vagrant-percise64-mwc"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://example.com/vagrant-precise64-mwc.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
### Change this to a unique address. 
### It should be in the subnet defined by virtualbox for your machine
  config.vm.network :private_network, ip: "192.168.42.101"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "./", "/vagrant",
    owner: "www-data", group: "www-data"

  # :extra => "dmode=775,fmode=664"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
   config.vm.provider :virtualbox do |vb|
     # Don't boot with headless mode
     # vb.gui = true

     # changing these settings can hava a dramatic effect on performance
     # Change VM memory allocation
     vb.customize ["modifyvm", :id, "--memory", "1024"]
     # Chenage VM CPU allocation
     vb.customize ["modifyvm", :id, "--cpus", "4"]
   end

  # View the documentation for the provider you're using for more
  # information on available options.

  config.vm.provision :shell, :path => "./scripts/provision.sh"

  # for Debug
#  config.vm.provision :shell, :path => "./scripts/prov_debug.sh"

end
