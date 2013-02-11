# Automatically precompile assets
load "deploy/assets"
 
# Execute "bundle install" after deploy, but only when really needed
require "bundler/capistrano"
 
# RVM integration
require "rvm/capistrano"
 
# Application name
set :application, "staffwisely_v2"
 
# Application environment
set :rails_env, :production
 
# Deploy username and sudo username
set :user, "ubuntu"
set :user_rails, "ubuntu"
 
# App Domain
set :domain, "beta.staffwisely.com"
 
# We don't want to use sudo (root) - for security reasons
set :use_sudo, false
 
# Target ruby version
set :rvm_ruby_string, '1.9.3'
 
# System-wide RVM installation
set :rvm_type, :user
 
# We use sudo (root) for system-wide RVM installation
set :rvm_install_with_sudo, true
 
# git is our SCM
set :scm, :git
 
# Use github repository
set :repository, "git@github.com:vincentpaca/staffwisely_v2.git"
 
# master is our default git branch
set :branch, "mcloud"
 
# Deploy via github
#set :deploy_via, :remote_cache
set :deploy_to, "/home/ubuntu/apps/#{application}"
 
# We have all components of the app on the same server
server domain, :app, :web, :db, :primary => true
 
# Install RVM and Ruby before deploy
before "deploy:setup", "rvm:install_rvm"
before "deploy:setup", "rvm:install_ruby"
 
# Apply default RVM version for the current account
after "deploy:setup", "deploy:set_rvm_version"
 
# Fix log/ and pids/ permissions
after "deploy:setup", "deploy:fix_setup_permissions"
 
# Fix permissions
before "deploy:start", "deploy:fix_permissions"
after "deploy:restart", "deploy:fix_permissions"
after "assetsrecompile", "deploy:fix_permissions"
 
# Clean-up old releases
after "deploy:restart", "deploy:cleanup"
 
# Unicorn config
set :unicorn_config, "#{current_path}/config/unicorn.conf.rb"
set :unicorn_binary, "bash -c 'source /etc/profile.d/rvm.sh && bundle exec unicorn_rails -c #{unicorn_config} -E #{rails_env} -D'"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"
set :su_rails, "sudo -u #{user_rails}"
 
namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    # Start unicorn server using sudo (rails)
    run "cd #{current_path} && #{su_rails} #{unicorn_binary}"
  end
 
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then #{su_rails} kill `cat #{unicorn_pid}`; fi"
  end
 
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then #{su_rails} kill -s QUIT `cat #{unicorn_pid}`; fi"
  end
 
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then #{su_rails} kill -s USR2 `cat #{unicorn_pid}`; fi"
  end
 
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
 
  task :set_rvm_version, :roles => :app, :except => { :no_release => true } do
    run "source /etc/profile.d/rvm.sh && rvm use #{rvm_ruby_string} --default"
  end
 
  task :fix_setup_permissions, :roles => :app, :except => { :no_release => true } do
    run "#{sudo} chgrp #{user_rails} #{shared_path}/log"
    run "#{sudo} chgrp #{user_rails} #{shared_path}/pids"
  end
 
  task :fix_permissions, :roles => :app, :except => { :no_release => true } do
    # To prevent access errors while moving/deleting
    run "#{sudo} chmod 775 #{current_path}/log"
    run "#{sudo} find #{current_path}/log/ -type f -exec chmod 664 {} \\;"
    run "#{sudo} find #{current_path}/log/ -exec chown #{user}:#{user_rails} {} \\;"
    run "#{sudo} find #{current_path}/tmp/ -type f -exec chmod 664 {} \\;"
    run "#{sudo} find #{current_path}/tmp/ -type d -exec chmod 775 {} \\;"
    run "#{sudo} find #{current_path}/tmp/ -exec chown #{user}:#{user_rails} {} \\;"
  end
 
  # Precompile assets only when needed
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      # If this is our first deploy - don't check for the previous version
      if remote_file_exists?(current_path)
        from = source.next_revision(current_revision)
        if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
          run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assetsrecompile}
        else
          logger.info "Skipping asset pre-compilation because there were no asset changes"
        end
      else
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assetsrecompile}
      end
    end
  end
end
 
# Helper function
def remote_file_exists?(full_path)
  'true' ==  capture("if [ -e #{full_path} ]; then echo 'true'; fi").strip
end
