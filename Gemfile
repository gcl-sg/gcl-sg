source 'https://gems.ruby-china.org'
# source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use pg as the database for Active Record
gem 'pg'
gem 'activerecord-import'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
gem 'hiredis'
gem 'redis-namespace'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'activemodel-serializers-xml'
gem 'subdomain_locale', github: 'kenniz/subdomain_locale'
gem 'local-subdomain'
gem 'devise', github: 'plataformatec/devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'ransack',             github: 'activerecord-hackery/ransack'
gem 'draper',              '> 3.x'
# gem 'sass-rails',          github: 'rails/sass-rails'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'activeadmin_addons'
gem 'enum_help'
gem 'pundit'
gem 'friendly_id', github: 'norman/friendly_id'
gem 'china_city'
gem 'awesome_nested_set'
gem "hstore_accessor"
gem 'rails-settings-cached', "~> 0.5.6"
gem 'dalli'
gem 'second_level_cache'
gem 'whenever', require: false

gem 'simple-navigation'
gem 'tabs_on_rails', :git => "git://github.com/kenniz/tabs_on_rails.git", :branch => 'master'
gem "breadcrumbs_on_rails"
gem 'twitter-typeahead-rails'
gem 'simple_form'
gem 'nested_form'
gem 'chosen-rails'

gem 'browser'
gem 'compass-rails'
gem 'bootstrap-sass'
gem 'font-awesome-rails'
gem 'bourbon'
gem 'slim'
gem 'kaminari'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'

gem 'mini_magick'
gem 'carrierwave'
gem 'jquery-fileupload-rails'

gem "lograge"
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'guard-spork', '~> 1.5.1'
  gem 'factory_girl_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'fontcustom'


  gem 'capistrano', '~> 3.4.0'
  # rails specific capistrano funcitons
  gem 'capistrano-rails', '~> 1.1.0'
  # integrate bundler with capistrano
  gem 'capistrano-bundler', '>= 1.1.0'
  gem 'capistrano-rvm'
  gem 'rvm1-capistrano3', :require => false
  # gem 'capistrano-rsync', :git => 'git://github.com/nifty/capistrano-rsync.git', :require => false
  gem 'capistrano-rsync', :github => 'paty-fakename/capistrano-rsync'
  gem 'capistrano-rails-console'
  # gem 'capistrano-sidekiq'
  # gem 'capistrano3-puma'
end

group :production do
  gem 'unicorn', '~> 4.6.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
