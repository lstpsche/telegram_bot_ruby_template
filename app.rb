# frozen_string_literal: true

# require gems
require 'active_record'
require 'dotenv/load'
require 'i18n'
require 'pry'
require 'rake'
require 'telegram/bot'

# require files
require_relative 'app/db'
require_relative 'app/constants'
# helpers
require_relative 'app/helpers/actions/users_helper'
# actions
require_relative 'app/actions/users/base'
require_relative 'app/actions/users/preferences'
require_relative 'app/actions/users/registration'
require_relative 'app/actions/users/options'
require_relative 'app/actions/features/base'
require_relative 'app/actions/features/menu'
# dialogs
require_relative 'app/dialogs/talker'
# handlers
require_relative 'app/handlers/base'
require_relative 'app/handlers/callbacks/base'
require_relative 'app/handlers/messages/base'
require_relative 'app/handlers/messages/common/base'
require_relative 'app/handlers/messages/common/preferences'
require_relative 'app/handlers/messages/common/menu'
require_relative 'app/handlers/messages/text/base'
# models
require_relative 'app/models/user'

require_relative 'app/context'
require_relative 'app/bot'
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
