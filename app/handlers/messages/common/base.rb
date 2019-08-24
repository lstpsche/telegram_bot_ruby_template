# frozen_string_literal: true

module Handlers
  module Messages
    module Common
      COMMAND_REGEX = /^\/(\w+)$/

      class Base < Handlers::Base
        attr_reader :bot, :tg_user

        def initialize(bot:, tg_user:)
          @bot = bot
          @tg_user = tg_user
        end

        def call(command)
          command = command.match(COMMAND_REGEX)[1]

          send(command)
        end

        def method_missing(method_name, *args, &block)
          no_method
        end

        def start
          return false if user_registered?(tg_id: tg_user.id)

          ::Actions::Users::Registration.new(bot: bot, tg_user: tg_user).launch
          Talker.send_shorten_help_message(bot: bot, chat_id: tg_user.id)
        end

        def main_menu
        end

        def preferences
          return false if user_registered?(tg_id: tg_user.id)

          ::Actions::Users::Preferences.new(bot: bot, tg_user: tg_user).show_options
        end

        def help
          Talker.send_help_message(bot: bot, chat_id: tg_user.id)
        end

        def no_method
        end

        private

        def user_registered?(tg_id:)
          User.find_by(tg_id: tg_id) ? true : false
        end
      end
    end
  end
end
