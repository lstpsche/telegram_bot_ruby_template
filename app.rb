# frozen_string_literal: true

# require gems
require 'active_record'
require 'dotenv/load'
require 'i18n'
require 'pry'
require 'rake'
require 'telegram/bot'

# require files
require_relative 'bot'
# handlers
require_relative 'handlers/base'
require_relative 'handlers/callbacks/base'
require_relative 'handlers/messages/common/base'
require_relative 'handlers/messages/text/base'
require_relative 'handlers/messages/base'

# require models
require_relative 'models/user'

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
