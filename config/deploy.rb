require 'bundler/capistrano'
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2'        # Or whatever env you want it to run in.

set :application, "linkodrama"
set :repository,  "git@github.com:railsrumble/rr10-team-157.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "rumble"

role :web, "li197-107.members.linode.com"                          # Your HTTP server, Apache/etc
role :app, "li197-107.members.linode.com"                          # This may be the same as your `Web` server
role :db,  "li197-107.members.linode.com", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, 'copy'
set :use_sudo, false
set :keep_releases, 5

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

before "deploy:restart", "deploy:migrate"
after "deploy", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end