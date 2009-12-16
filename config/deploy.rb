# Necessary to run on Site5
set :use_sudo, false
set :group_writable, false

# Less releases, less space wasted
set :keep_releases, 2

# The mandatory stuff
set :application, "societyforjustice"
set :user, "dextersm"
set :password, "3digital"

# GIT information
default_run_options[:pty] = true
set :repository,  "git://github.com/admindexter/Another-repository-for-societyforjustice-website.git"

set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache



# This is related to site5 too.
set :deploy_to, "/home/dextersm/apps/societyforjustice"

role :app, "dextersmart.com"
role :web, "dextersmart.com"
role :db,  "dextersmart.com", :primary => true


# In the deploy namespace we override some default tasks and we define
# the site5 namespace.
namespace :deploy do
  desc <<-DESC
    Deploys and starts a `cold' application. This is useful if you have not \
    deployed your application before, or if your application is (for some \
    other reason) not currently running. It will deploy the code, run any \
    pending migrations, and then instead of invoking `deploy:restart', it will \
    invoke `deploy:start' to fire up the application servers.
  DESC
  # NOTE: we kill public_html so be sure to have a backup or be ok with this application
  # being the default app for the domain.
  task :cold do
    update
    site5::link_public_html
    site5::kill_dispatch_fcgi
  end

  desc <<-DESC
    Site5 version of restart task.
  DESC
  task :restart do
    site5::kill_dispatch_fcgi
  end

  namespace :site5 do
    desc <<-DESC
      Links public_html to current_release/public
    DESC
    task :link_public_html do
      run "cd /home/dextersm; rm -rf public_html; ln -s /home/dextersm/apps/societyforjustice/current/public/ public_html"
    end

    desc <<-DESC
      Kills Ruby instances on Site5
    DESC
    task :kill_dispatch_fcgi do
      run "skill -u dextersm -c ruby"
    end

    desc "Ensure files and folders have correct permissions on site5"
    task :fix_permissions do
      run "find /home/dextersm/apps/societyforjustice/current/public/ -type d -exec chmod 0755 {} \\;"
      run "find /home/dextersm/apps/societyforjustice/current/public/ -type f -exec chmod 0644 {} \\;"
      run "chmod 0755 /home/dextersm/apps/societyforjustice/current/public/dispatch.*"
      run "chmod -R 0755 /home/dextersm/apps/societyforjustice/current/script/*"
    end

    task :after_deploy do
      deploy::site5::fix_permissions
    end

  end
end

