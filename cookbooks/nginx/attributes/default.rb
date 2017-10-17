# Attributes:: default
#
default['nginx']['list_ports'] = [80]
default['nginx']['socket'] = "#{normal['home']}/sockets/puma.sock"
default['nginx']['root'] = "#{normal['path']}/public"
default['nginx']['path'] = "/etc/nginx"
default['nginx']['sites_available'] = "/etc/nginx/sites-available"

default['nginx']['logs'] = {
  access: "app.access.log",
  error: "app.error.log"
}

default['nginx']['keepalive_timeout'] = 5
default['nginx']['proxy_read_timeout'] = 120
default['nginx']['proxy_send_timeout'] = 120
