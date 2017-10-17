# Cookbook:: nginx
# Recipe:: configure

template "#{node['nginx']['sites_available']}/default" do
  source 'default.erb'
  owner 'root'
  group 'root'
  mode 0644
  variables(
    root: node['nginx']['root'],
    server: node['nginx']['socket'],
    list_ports: node['nginx']['list_ports'],
    logs: node['nginx']['logs'],
    keepalive_timeout: node['nginx']['keepalive_timeout'],
    proxy_read_timeout: node['nginx']['proxy_read_timeout'],
    proxy_send_timeout: node['nginx']['proxy_send_timeout']
  )
end

template "#{node['nginx']['path']}/nginx.conf" do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
end
