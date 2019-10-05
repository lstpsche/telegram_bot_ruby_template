# frozen_string_literal: true

namespace :app do
  task 'require_gems' do
    require 'active_record'
    require 'dotenv/load'
    require 'i18n'
    require 'json'
    require 'net/http'
    require 'pry'
    require 'require_all'
    require 'securerandom'
    require 'telegram/bot'
    require 'time'
    require 'uri'
  end

  task 'require_files' do
    # ORDER MATTERS

    ## helpers
    require_all 'app/helpers'
    ## services
    require_all 'app/services'
    ## actions
    require_all 'app/actions/users'
    require_all 'app/actions/features'
    # TEMPLATE_TODO: require here your features folders
    ## dialogs
    require_all 'app/dialogs'
    ## handlers
    require_all 'app/handlers/callbacks'
    require_all 'app/handlers/text_commands'
    ## routers
    require_all 'app/routers'
    ## serializers
    require_all 'app/serializers'
    ## models
    require_all 'app/models'

    ## global files
    require_all 'app/*.rb'
  end

  task 'load_locales' do
    I18n.load_path << Dir[File.expand_path("lib/locales") + "/*.yml"]
    I18n.default_locale = :en
  end

  desc 'Require all files and gems'
  task 'require_everything' do
    rake_app = Rake.application

    rake_app['app:require_gems'].invoke
    rake_app['app:require_files'].invoke
    rake_app['db:connect'].invoke
    rake_app['app:load_locales'].invoke
  end
end
