
# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require "whenever/capistrano"
require "capistrano/rsync"
require 'capistrano/rails/console'

# TODO: not use sidekiq yet
# require 'capistrano/sidekiq'
# require 'capistrano/sidekiq/monit' #to require monit tasks # Only for capistrano3

# TODO: not use puma for action cable yet
# require 'capistrano/puma'
# require 'capistrano/puma/monit'   # if you need the monit tasks

# require 'capistrano/puma/workers' # if you want to control the workers (in cluster mode)
# require 'capistrano/puma/jungle'  # if you need the jungle tasks
# require 'capistrano/puma/nginx'   # if you want to upload a nginx site template

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
# hint from: http://www.talkingquickly.co.uk/2014/01/deploying-rails-apps-to-a-vps-with-capistrano-v3/
Dir.glob('lib/capistrano/**/*.rb').each { |r| import r }

