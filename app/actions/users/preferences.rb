# frozen_string_literal: true

module Actions
  module Users
    class Preferences
      include Helpers::Actions::Users::PreferencesHelper

      OPTIONS = [
        'example_option_1',
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
          setup_successfull
          # TODO: show 'successfully setup' WITH RemoveKeyboard markup
        else
          # TODO: show 'something's wrong'
          # TODO: handle this
        end
      end

      def show_options
        show_options_menu
      end

      private

      def get_response
        # THIS RESPONSE CAN BE FROM ANOTHER PERSON
        # SHOULD TEST IT
        # AND MAYBE ADD CHECKER, IF RESPONSE IS FROM NEEDED USER
        @response = talker.get_message

        case response
        when Telegram::Bot::Types::Message
          return response.text
        when Telegram::Bot::Types::CallbackQuery
          return response.data
        end
      end

      def option_send_message_get_response(option_name:, markup: nil)
        send_option_message(option_name, markup)

        get_response
      end

      def example_option_1
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
