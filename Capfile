load 'deploy' if respond_to?(:namespace) # cap2 differentiator
load 'deploy/assets'
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

require 'bundler/capistrano'
require 'whenever/capistrano'

set :application, 'theglamourist'
set :scm, 'git'
set :repository, 'git@github.com:visnup/theglamourist.git'
set :deploy_via, :remote_cache

set :user, 'app'
set :rails_env, 'production'
set :use_sudo, false
set :default_shell, 'bash -l'
set :normalize_asset_timestamps, false

set :whenever_command, 'bundle exec whenever'

role :web, 'theglamourist.com'
role :db, 'theglamourist.com', :primary => true

namespace :deploy do
  desc 'Restart Application'
  task :restart, :roles => :web do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :request, :roles => :db do
    run 'curl -s http://theglamourist.com >/dev/null'
    run 'curl -s http://theglamourist.com/blog >/dev/null'
    run 'curl -s http://theglamourist.com/services >/dev/null'
    run 'curl -s http://theglamourist.com/contacts/new >/dev/null'
  end

  task :finalize_update_more, :except => { :no_release => true } do
    run "ln -s #{shared_path}/production.sqlite3 #{release_path}/db/production.sqlite3"
    run "ln -s #{shared_path}/node_modules #{release_path}/node_modules"
  end

  namespace :npm do
    desc 'Runs npm install'
    task :install do
      run "cd #{release_path} && npm --quiet install --production"
    end
  end
end

# Callbacks

after  'deploy:finalize_update',   'deploy:finalize_update_more'
before 'deploy:assets:precompile', 'deploy:npm:install'
after  'deploy:restart',           'deploy:request'

# vim:syntax=ruby
