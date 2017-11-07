#
# Cookbook:: instance
# Recipe:: configure
#
# add bashrc to bash_profile
template "#{node.normal['home']}/.bash_profile" do
  source "bash_profile.erb"
  owner node.normal['user']
  group node.normal['user']
  mode 0775
end

# add environment
execute "include rails environment" do
  user 'root'
  group 'root'
  command <<-EOH
  head -n 1 /etc/environment > environment
  echo RAILS_ENV=#{node.normal["environment"]} >> environment
  cat environment > /etc/environment
  EOH
end

execute 'set locale' do
  user 'root'
  group 'root'
  command <<-EOH
  locale-gen es_ES.UTF-8
  EOH
end

# create swap
bash "create swap file #{node['instance']['swapfile_name']}" do
  user 'root'
  code <<-EOC
    dd if=/dev/zero of=#{node['instance']['swapfile_name']} bs=1M count=#{node['instance']['swapfile_size_mb']}
    mkswap #{node['instance']['swapfile_name']}
    chown root:root #{node['instance']['swapfile_name']}
    chmod 0600 #{node['instance']['swapfile_name']}
  EOC
  creates node['instance']['swapfile_name']
end

mount 'swap' do
  action :enable
  device node['instance']['swapfile_name']
  fstype 'swap'
end

bash 'activate all swap devices' do
  user 'root'
  code 'swapon -a'
end
