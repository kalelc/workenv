# Cookbook:: sidekiq
# Recipe:: start
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute "start sidekiq" do
  cwd node.normal['path']
  user node.normal['user']
  group node.normal['user']
  environment({
    'PATH' => "#{node.normal['home']}/.rbenv/bin:#{node.normal['home']}/.rbenv/plugins/ruby-build/bin:#{node.normal['home']}/.rbenv/shims:#{ENV['PATH']}",
    'HOME' => node.normal['home']
  })
  command "bundle exec sidekiq -c #{node['sidekiq']['concurrency']} -t #{node['sidekiq']['timeout']} -P #{node['sidekiq']['pidfile']} -L #{node['sidekiq']['logfile']} -C #{node['sidekiq']['config']} -d"
end
