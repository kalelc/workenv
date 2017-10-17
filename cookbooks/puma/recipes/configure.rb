# Cookbook:: puma
# Recipe:: configure
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
# folders
node['puma']['folders'].each do |dir|
  directory "#{node.normal['home']}/#{dir}" do
    mode 0755
    owner node.normal['user']
    group node.normal['user']
    action :create
    recursive true
  end
end

# puma config file
template "#{node.normal['path']}/#{node['puma']['file']}" do
  source "#{node['puma']['file']}.erb"
  owner node.normal['user']
  group node.normal['user']
  mode 0775
  variables(
    workers: node['puma']['workers'],
    threads: node['puma']['threads'],
    folders: node['puma']['folders'],
    bind: node['puma']['bind'],
    pid: node['puma']['pid'],
    state: node['puma']['state'],
    access_log: node['puma']['stdout'],
    error_log: node['puma']['stderr'],
    environment: node.normal['environment']
  )
end
