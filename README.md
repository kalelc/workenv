#  Work Environment to RubyOnRails

This project create and configure virtual machine to run Rails App.

#### Vagrant

##### Technical Description

###### Variables

`memory` Virtual Machine memory, set in `2GB` (2048).

`swap_size` Virtual Machine swap, set in `512MB` (512).

`host_app` location app code on the host machine, this folder is shared to the virtual machine.

`virtual_home` Home path in virtual machine.

`virtual_app` App path in virtual machine.

##### Commands

`vagrant up` Install and configure machine.

`vagrant provision` Run recipes into machine.

`vagrant ssh` Log-in in machine.

`vagrant destroy` Delete machine.

To see more commands you can run `vagrant --help`.

#### Chef Recipes

##### Description

###### Instance
`instance::configure` Create `.bash_profile`, add environment and create swap to instance(s).

###### Packages
`packages::essential` Install essential package.

`packages::extra` Install extra package dependences to run rails app.

###### Nginx
`nginx::install` Install nginx package.

`nginx::configure` Configure nginx and overwrite site.

###### Rails
`rails::rbenv` Install rbenv to manage ruby version.

`rails::install` Install ruby and rails versions.

###### App
`app::deploy` Bundle install and decrypt config files.

###### Databases
`databases::mongodb` Install MongoDB Server.

###### Puma
`puma::configure` Create basic folders and template puma config.

`puma::start` Start puma.
