# frozen_string_literal: true

module Handlers
  module Messages
    class Base < Handlers::Base
      attr_reader :bot, :tg_user

      def initialize(bot:)
        @bot = bot
      end

      def call(message)
        text = message.text
        @tg_user = message.from

        if text.match(Constants.command_regex)
          parse_common_command(text)
        else
          parse_message_text(text)
        end
      end

      private

      def parse_common_command(command)
        parsed_command = command.match(Constants.command_regex)

        Handlers::Messages::Common::Base.new(bot: bot, tg_user: tg_user).(parsed_command[1])
      end

      def parse_message_text(command)
        Handlers::Messages::Text::Base.new(bot: bot, tg_user: tg_user).(command)
      end
    end
  end
end
