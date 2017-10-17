#vi: set ft=ruby :

# Variables
memory = "2048"
cpus = 2
swap_size= 512

# Path where you have app code
host_app = "/Users/andres/workspace/ruby/rails"
# Virtual Machine home path
virtual_home = "/home/ubuntu"
# Vritual machine app path
virtual_app = "#{virtual_home}/app"

# Vagrant configuration
Vagrant.configure("2") do |config|
  config.vm.hostname = "workenv"
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 80, host: 10000, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 3000, host: 30000, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder host_app, virtual_app

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.memory = memory
    vb.cpus = cpus
  end

  #Enable provisioning with chef solo to use recipes the same way that opsworks
  config.vm.provision 'chef_solo' do |chef|
    chef.cookbooks_path = 'cookbooks'
    chef.add_recipe "instance::configure"
    chef.add_recipe "packages::essential"
    chef.add_recipe "packages::extra"
    chef.add_recipe "nginx::install"
    chef.add_recipe "nginx::configure"
    chef.add_recipe "rails::rbenv"
    chef.add_recipe "rails::install"
    chef.add_recipe 'app::deploy'
    chef.add_recipe 'databases::mongodb'
    chef.add_recipe 'puma::configure'
    chef.add_recipe 'puma::start'

    chef.json = {
      "user" => "ubuntu",
      "environment" => "development",
      "home" => virtual_home,
      "path" => virtual_app,
      "sockets" => "#{virtual_home}/sockets",
      "pids" => "#{virtual_home}/pids",
      "logs" => "#{virtual_home}/log",
      "ruby_version" => "2.3.3",
      "rails_version" => "4.2.7.1",
      "instance" => {
        "swapsize" => swap_size
      },
      "puma" => {
        "workers" => 2,
        "threads" => [6, 16]
      },
    }
  end
end
