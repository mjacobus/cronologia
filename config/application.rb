require_relative 'boot'

# https://github.com/rails/rails/blob/master/railties/lib/rails/all.rb
# require 'rails/all'
# rubocop:disable Style/RedundantBegin

require "rails"

[
  # 'active_record/railtie',
  # 'active_storage/engine',
  'action_controller/railtie',
  'action_view/railtie',
  # 'action_mailer/railtie',
  # 'active_job/railtie',
  # 'action_cable/engine',
  # 'action_mailbox/engine',
  # 'action_text/engine',
  # 'rails/test_unit/railtie',
  'sprockets/railtie',
].each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cronologia
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.available_locales = ["pt-BR"]
    config.i18n.default_locale = 'pt-BR'
    config.time_zone = 'America/Sao_Paulo'

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
    end

    config.autoload_paths << "#{Rails.root}/lib"
  end
end
