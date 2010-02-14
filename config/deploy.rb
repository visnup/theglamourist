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
end

namespace :bundle do
  desc "Check gem dependencies"
  task :check do
    run "cd #{release_path} && bundle check"
  end
end

after "deploy:update_code", "bundle:check"
