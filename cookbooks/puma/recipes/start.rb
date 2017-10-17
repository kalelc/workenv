# Cookbook:: puma
# Recipe:: start
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute "bundle exec puma -C #{node['puma']['file']}" do
  cwd node.normal['path']
  user node.normal['user']
  group node.normal['user']
  environment({
    'PATH' => "#{node.normal['home']}/.rbenv/bin:#{node.normal['home']}/.rbenv/plugins/ruby-build/bin:#{node.normal['home']}/.rbenv/shims:#{ENV['PATH']}",
    'HOME' => node.normal['home']
  })
end

