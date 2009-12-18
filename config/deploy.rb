# Necessary to run on Site5
set :use_sudo, false
set :group_writable, false

# Less releases, less space wasted
set :keep_releases, 2

# The mandatory stuff
set :application, "societyforjustice"
set :user, "societyf"
set :password, "3digital"

# GIT information
default_run_options[:pty] = true
set :repository,  "git://github.com/admindexter/Final-societyforjustice-website-developed-in-2.3.5.git"

set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache



# This is related to site5 too.
set :deploy_to, "/home/societyf/apps/societyforjustice"

role :app, "societyforjustice.com"
role :web, "societyforjustice.com"
role :db,  "societyforjustice.com", :primary => true


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
      run "cd /home/societyf; rm -rf public_html; ln -s /home/societyf/apps/societyforjustice/current/public/ public_html"
    end

    desc <<-DESC
      Kills Ruby instances on Site5
    DESC
    task :kill_dispatch_fcgi do
      run "skill -u societyf -c ruby"
    end

    desc "Ensure files and folders have correct permissions on site5"
    task :fix_permissions do
      run "find /home/societyf/apps/societyforjustice/current/public/ -type d -exec chmod 0755 {} \\;"
      run "find /home/societyf/apps/societyforjustice/current/public/ -type f -exec chmod 0644 {} \\;"
      run "chmod 0755 /home/societyf/apps/societyforjustice/current/public/dispatch.*"
      run "chmod -R 0755 /home/societyf/apps/societyforjustice/current/script/*"
    end

    task :after_deploy do
      deploy::site5::fix_permissions
    end

  end
end

