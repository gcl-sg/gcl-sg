require_relative 'boot'

require 'rails/all'
require 'elasticsearch/rails/instrumentation'
require 'elasticsearch/rails/lograge'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GclSg
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.available_locales = [:en, :'zh-CN', :'zh-TW']
    config.i18n.default_locale = :'zh-CN'

    # settings for subdomain_locale
    config.default_locale = :'zh-CN'         # www.lvh.me
    config.default_subdomain = 'www'
    config.subdomain_locale['en'] = :en      # en.lvh.me
    config.subdomain_locale['tc'] = :'zh-TW' # tc.lvh.me

    config.time_zone = 'Beijing'
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)

    # lograge enabled for elasticsearch
    config.lograge.enabled = true
  end
end
