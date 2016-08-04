# config valid only for Capistrano 3.1
# lock '3.2.1'

set :application, 'gcl_sg'
set :deploy_user, 'deploy'

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

# setup repo details
# Default value for :scm is :git

# This is a workaround until capistrano/capistrano#929 is resolved.
set :scm, :rsync
set :rsync_options, %w[--recursive --delete --delete-excluded --exclude .git*]
set :build_dir, '../station_build'

set :repo_url, 'https://github.com/gcl-sg/gcl-sg.git'
set :branch, :master

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# capistrano/rvm
# https://github.com/capistrano/rvm
# deploy.rb or stage file (staging.rb, production.rb or else)
# set :rvm_type, :user                         # Defaults to: :auto, [:auto, :system, :user]
# set :rvm_ruby_version, '2.1.2@nandudu'       # Defaults to: 'default'
# set :rvm_custom_path, '~/.myveryownrvm'      # only needed if not detected
# set :rvm_roles, [:app, :web]

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# files we want symlinking to specific entries in shared.
set :linked_files, %w{config/database.yml config/secrets.yml}
# config/mongoid.yml config/sidekiq.yml config/cable.yml

# dirs we want symlinking to shared
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads public/shared}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
set :tests, []

# # sidekiq settings (not use sidekiq.yml.erb anymore)
# set :sidekiq_default_hooks, -> { true }
# set :sidekiq_pid, -> { File.join(shared_path, 'tmp', 'pids', 'sidekiq.pid') }
# set :sidekiq_env, -> { fetch(:rack_env, fetch(:rails_env, fetch(:stage))) }
# set :sidekiq_log, -> { File.join(shared_path, 'log', 'sidekiq.log') }
# set :sidekiq_options, -> { nil }
# set :sidekiq_require, -> { nil }
# set :sidekiq_tag, -> { nil }
# set :sidekiq_config, -> { nil } # if you have a config/sidekiq.yml, do not forget to set this.
# set :sidekiq_queue, -> { nil }
# set :sidekiq_timeout, -> { 300 }
# set :sidekiq_role, -> { :app }
# set :sidekiq_processes, -> { 3 }
# set :sidekiq_options_per_process, ["--queue critical --queue high --queue default --concurrency 10", "--queue instant_report --queue report --concurrency 5", "--queue data_process --concurrency 7"]
# set :sidekiq_concurrency, -> { nil }
# set :sidekiq_monit_templates_path, 'config/deploy/shared'
# set :sidekiq_monit_use_sudo, true
# set :sidekiq_user, -> { "#{fetch(:deploy_user)}" }

# # puma configuration
# set :puma_default_hooks, -> { false } # do not restart puma while running normal deploy, after modify cable need to manual restart puma server
# set :puma_role, :app
# set :puma_user, fetch(:deploy_user)
# set :puma_threads, [0, 16]
# set :puma_rackup, -> { File.join(current_path, 'cable', 'config.ru') }
# set :puma_bind, -> { ["tcp://0.0.0.0:9001", File.join("unix://#{shared_path}", 'tmp', 'sockets', 'puma.sock')] } #accept array for multi-bind
# set :puma_conf, -> { File.join(shared_path, 'config', 'puma_cable.rb') }
# set :puma_preload_app, true
# set :puma_monit_service_name, -> { "puma_#{fetch(:application)}_#{fetch(:stage)}" }

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(
  nginx.conf
  database.example.yml
  log_rotation
  monit
  unicorn.rb
  unicorn_init.sh
))

# which config files should be made executable after copying
# by deploy:setup_config
set(:executable_config_files, %w(
  unicorn_init.sh
))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
set(:symlinks, [
    {
        source: "nginx.conf",
        link: "/etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
    },
    {
        source: "unicorn_init.sh",
        link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
    },
    {
        source: "log_rotation",
        link: "/etc/logrotate.d/#{fetch(:full_app_name)}"
    },
    {
        source: "monit",
        link: "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
    }
])

set :bundle_binstubs, -> { shared_path.join('bin') }

# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

namespace :deploy do
  # make sure we're deploying what we think we're deploying
  before :deploy, "deploy:check_revision"
  # only allow a deploy with passing tests to deployed
  before :deploy, "deploy:run_tests"
  # compile assets locally then rsync
  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'

  # remove the default nginx configuration as it will tend
  # to conflict with our configs.
  before 'deploy:setup_config', 'nginx:remove_default_vhost'

  # reload nginx to it will pick up any modified vhosts from
  # setup_config
  after 'deploy:setup_config', 'nginx:reload'

  # Restart monit so it will pick up any monit configurations
  # we've added
  after 'deploy:setup_config', 'monit:restart'

  # As of Capistrano 3.1, the `deploy:restart` task is not called
  # automatically.
  after 'deploy:publishing', 'deploy:restart'

end

# namespace :deploy do
#
#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       # execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end
#
#   after :publishing, :restart
#
#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end
#
# end
