set :stage, :staging
set :branch, 'develop'

# This is used in the Nginx VirtualHost to specify which domains
# the app should appear on. If you don't yet have DNS setup, you'll
# need to create entries in your local Hosts file for testing.
set :server_name, 'station.nandudu.com'



server '10.91.54.177', user: 'deploy', roles: %w{web app db}, primary: true

set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :staging

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 5

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false

# whenever configuration
set :whenever_identifier, ->{ "#{fetch(:full_app_name)}" }
# whenever default use the :db role
set :whenever_roles,      ->{ :app }


namespace :deploy do
  # Should run seed_fu manually, cause it takes long time
  # after 'deploy:publishing', 'db:seed_fu'
end
