# frozen_string_literal: true

module Handlers
  module Messages
    module Common
      class Base < Handlers::Base
        attr_reader :bot, :tg_user

        def initialize(bot:, tg_user:)
          @bot = bot
          @tg_user = tg_user
        end

        def call(command)
          send(command)
        end

        def start
          return false if user_registered?(id: tg_user.id)

          ::Actions::Users::Registration.new(bot: bot, tg_user: tg_user).launch
          Talker.send_shorten_help_message(bot: bot, chat_id: tg_user.id)
        end

        def main_menu
          # show "not registered" message and say to run "/start"
          # move this ^^ to Handlers::Base
        end

        def preferences
          return false unless user_registered?(id: tg_user.id)

          ::Actions::Users::Preferences.new(bot: bot, chat_id: tg_user.id).show_options
        end

        def help
          Talker.send_help_message(bot: bot, chat_id: tg_user.id)
        end
      end
    end
  end
end
