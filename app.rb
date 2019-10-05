# frozen_string_literal: true

# require gems
require 'active_record'
require 'dotenv/load'
require 'i18n'
require 'json'
require 'net/http'
require 'pry'
require 'rake'
require 'require_all'
require 'securerandom'
require 'telegram/bot'
require 'time'
require 'uri'

# require files
## helpers
require_all 'app/helpers'
## services
require_all 'app/services'
## actions
require_all 'app/actions/users'
require_all 'app/actions/features'
require_all 'app/actions/features/schedules'
## dialogs
require_relative 'app/dialogs/talker'
## handlers
require_all 'app/handlers/callbacks'
## routers
require_all 'app/routers'
## serializers
require_all 'app/serializers'
## models
require_all 'app/models'

## global files
require_all 'app/*.rb'

# initialize what's needed
## rake
rake_app = Rake.application
rake_app.init
rake_app.load_rakefile
rake_app['db:connect'].invoke

## i18n localizations
I18n.load_path << Dir[File.expand_path("lib/locales") + "/*.yml"]
I18n.default_locale = :en

# launch bot
Bot.new(ENV['BOT_TOKEN']).launch
