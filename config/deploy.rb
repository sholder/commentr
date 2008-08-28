set :application, "commentr"

set :scm, :git
set :repository,  "git://github.com/sholder/commentr.git"
set :branch, 'master'
set :deploy_via, :remote_cache

set :deploy_to, "/home/sholder/webapps/commentr"

set :use_sudo, false
set :user, 'sholder'
set :ssh_options, { :forward_agent => true }

role :app, "teamholder.com"
role :web, "teamholder.com"
role :db,  "teamholder.com", :primary => true

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end