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
  task :default do
    symlink
    install
  end

  desc "Symlink the bundle install location to a shared location"
  task :symlink do
    run "[ -d #{shared_path}/bundle ] || mkdir #{shared_path}/bundle"
    run "ln -fs #{shared_path}/bundle #{release_path}/vendor/bundle"
  end

  desc "Check gem dependencies"
  task :install do
    run "cd #{release_path} && bundle install --deployment"
  end
end

after "deploy:update_code", "bundle"
