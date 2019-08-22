# frozen_string_literal: true

module Actions
  module Users
    class Preferences
      OPTIONS = [
        'option_1'
      ]

      attr_reader :bot, :chat_id

      def initialize(bot:, chat_id:)
        @bot = bot
        @chat_id = chat_id
      end

      def setup(user_id:)
        OPTIONS.each do |option_name|
          send(option_name, true)
        end
      end

      private

      def option_1
        case Context.get(user.tg_id)
        when "preferences_#{option_name}"
          # read response message
          # setup option
        else
          option_name = __callee__.to_s
          message_text = I18n.t("actions.users.preferences.#{option_name}")
          talker.send_message(text: message_text, chat_id: chat_id)
          Context.set(user.tg_id, "preferences_#{option_name}")
        end
      end
    end
  end
end
