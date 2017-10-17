default['sidekiq']['config'] = 'config/sidekiq.yml'
default['sidekiq']['timeout'] = normal['sidekiq']['timeout']
default['sidekiq']['pidfile'] = "#{normal['pids']}/sidekiq.pid"
default['sidekiq']['logfile'] = "#{normal['logs']}/sidekiq.log"
default['sidekiq']['concurrency'] = normal['sidekiq']['concurrency']
