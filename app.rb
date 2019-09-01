# frozen_string_literal: true

# require gems
require 'active_record'
require 'dotenv/load'
require 'i18n'
require 'pry'
require 'rake'
require 'require_all'
require 'telegram/bot'

# require files
## helpers
require_all 'app/helpers'
## actions
require_all 'app/actions/users'
require_all 'app/actions/features'
## dialogs
require_relative 'app/dialogs/talker'
## handlers
require_relative 'app/handlers/base'
require_all 'app/handlers/callbacks'
require_all 'app/handlers/messages'
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
