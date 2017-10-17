# Cookbook:: sidekiq
# Recipe:: stop
#
# Copyright:: 2017, The Authors, All Rights Reserved.

if File.exist?(node['sidekiq']['pidfile'])
  execute "stop sidekiq" do
    cwd node.normal['path']
    user node.normal['user']
    group node.normal['user']
    environment({
      'PATH' => "#{node.normal['home']}/.rbenv/bin:#{node.normal['home']}/.rbenv/plugins/ruby-build/bin:#{node.normal['home']}/.rbenv/shims:#{ENV['PATH']}",
      'HOME' => node.normal['home']
    })
    command "bundle exec sidekiqctl stop #{node['sidekiq']['pidfile']}"
    returns [0,1]
  end
end
