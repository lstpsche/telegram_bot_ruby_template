# frozen_string_literal: true

require 'rake'
# require all gems, files, locales
# connect database
rake_app = Rake.application
rake_app.init
rake_app.load_rakefile
rake_app['app:require_everything'].invoke

# launch bot
Bot.new(ENV['BOT_TOKEN']).launch
