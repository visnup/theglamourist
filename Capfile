load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

require "bundler/capistrano"

set :application, "theglamourist"
set :scm, "git"
set :repository, "git@github.com:visnup/theglamourist.git"
set :deploy_via, :remote_cache

set :user, "app"
set :rails_env, "production"
set :use_sudo, false

role :web, "theglamourist.com"
role :db, "theglamourist.com", :primary => true

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :web do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :finalize_update_more, :except => { :no_release => true } do
    run <<-CMD
      ln -s #{shared_path}/production.sqlite3 #{latest_release}/db/production.sqlite3
    CMD
  end
end

after "deploy:finalize_update", "deploy:finalize_update_more"

# vim:syntax=ruby
