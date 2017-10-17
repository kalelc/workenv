#
# Cookbook:: packages
# Recipe:: essential
#
execute "update_apt" do
  command "apt-get update"
  action :run
end

node['packages']['essential'].each do |pkg|
  package pkg do
    action :install
  end
end
