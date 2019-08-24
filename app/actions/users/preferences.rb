# frozen_string_literal: true

module Actions
  module Users
    class Preferences
      OPTIONS = [
        'option_1',
        'vegetarian'
      ]

      attr_reader :bot, :chat_id, :response, :talker, :user

      def initialize(bot:, chat_id:)
        @bot = bot
        @chat_id = chat_id
        @talker = Talker.new(bot: bot)
      end

      def setup(user_id)
        @user = User.find_by(id: user_id)

        OPTIONS.each do |option_name|
          send(option_name)
        end

        if user.save
          # TODO: show 'successfully setup'
        else
          # TODO: show 'something's wrong'
          # TODO: handle this
        end
      end

      private

      def option_send_message_get_response(option_name:, markup: nil)
        message_text = I18n.t("actions.users.preferences.#{option_name}")
        talker.send_message(text: message_text, chat_id: chat_id, markup: markup)
        # THIS RESPONSE CAN BE FROM ANOTHER PERSON
        # SHOULD TEST IT
        # AND MAYBE ADD CHECKER, IF RESPONSE IS FROM NEEDED USER
        @response = talker.get_message

        res_class = response.class.to_s.split('::').last
        if res_class == 'Message'
          return response.text
        elsif res_class == 'CallbackQuery'
          return response.data
        end
      end

      def option_1
        option_send_message_get_response(option_name: __callee__.to_s)
        # set something up here
      end

      def vegetarian
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(
          keyboard: [[I18n.t('common.yes'), I18n.t('common.no')], []],
          one_time_keyboard: true
        )
        response_msg = option_send_message_get_response(option_name: __callee__.to_s, markup: markup)

        case response_msg
        when 'Yes'
          user.update(vegetarian: true)
        when 'No'
          user.update(vegetarian: false)
        end
      end
    end
  end
end
