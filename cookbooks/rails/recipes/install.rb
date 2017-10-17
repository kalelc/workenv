#
# Cookbook:: rails
# Recipe:: install
#

execute "ruby_with_rails" do
  user node.normal["user"]
  group node.normal["user"]
  environment({
    "PATH" => "#{node.normal["home"]}/.rbenv/bin:#{node.normal["home"]}/.rbenv/plugins/ruby-build/bin:#{node.normal["home"]}/.rbenv/shims:#{ENV['PATH']}",
    "HOME" => node.normal["home"]
  })

  command <<-EOH
  rbenv install #{node.normal["ruby_version"]} --skip-existing
  rbenv global #{node.normal["ruby_version"]}
  gem install bundler
  gem install rails -v #{node.normal['rails_version']}
  EOH
end
