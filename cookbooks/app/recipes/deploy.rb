# Cookbook:: app
# Recipe:: deploy
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# bundle install
execute 'bundle install' do
  cwd node.normal['path']
  user node.normal['user']
  group node.normal["user"]
  environment({
    'PATH' => "#{node.normal['home']}/.rbenv/bin:#{node.normal['home']}/.rbenv/plugins/ruby-build/bin:#{node.normal['home']}/.rbenv/shims:#{ENV['PATH']}",
    'HOME' => node.normal['home']
  })
end

# decrypt files
node.normal['config']['files'].each do |file|
  execute 'decrypt files' do
    cwd node.normal['path']
    command "openssl aes-256-cbc -d -a -in #{node.normal['path']}/config/#{file}.enc -out #{node.normal['path']}/config/#{file} -k #{node.normal['config']['password']}"
  end
end

# create tmp folder
directory "#{node.normal['path']}/tmp" do
  mode 0755
  owner node.normal['user']
  group node.normal['user']
  action :create
  recursive true
end
