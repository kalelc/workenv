#
# Cookbook:: rails
# Recipe:: rbenv
#

# rbenv
git "#{node.normal["home"]}/.rbenv" do
  repository node["ruby"]["rbenv"]
  user node.normal["user"]
  group group node.normal["user"]
end

execute "rbenv" do
  cwd node.normal["home"]
  command <<-EOH
  echo 'export PATH="#{node.normal["home"]}/.rbenv/bin:$PATH"' >> .bash_profile
  echo 'eval "$(rbenv init -)"' >> .bash_profile
  exec $SHELL
  EOH
end

# ruby-build
directory "#{node.normal["home"]}/.rbenv/plugins" do
  owner node.normal["user"]
  group node.normal["user"]
  mode '0755'
  action :create
end

git "#{node.normal["home"]}/.rbenv/plugins/ruby-build" do
  repository node["ruby"]["ruby_build"]
  user node.normal["user"]
  group node.normal["user"]
end

execute "ruby_build" do
  cwd node.normal["home"]
  command <<-EOH
  echo 'export PATH="#{node.normal["home"]}/.rbenv/plugins/ruby-build/bin:$PATH"' >> .bash_profile
  exec $SHELL
  EOH
end
