#
# Cookbook:: packages
# Recipe:: extra
#
#
node['packages']['extra'].each do |pkg|
  package pkg do
    action :install
  end
end
