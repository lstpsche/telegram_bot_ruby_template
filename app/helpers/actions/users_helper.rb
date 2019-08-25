# frozen_string_literal: true

module Helpers
  module Actions
    module UsersHelper
      def send_option_message(option_name, chat_id, markup = nil)
        message_text = I18n.t("actions.users.options.#{option_name}")
        talker.send_message(text: message_text, chat_id: chat_id, markup: markup)
      end

      def setup_successfull
        talker.send_message(
          text: I18n.t('actions.users.preferences.setup_successful'),
          chat_id: chat_id,
          markup: 'remove'
        )
      end

      def show_options_menu
        options_kb = options_menu_inline_buttons

        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: options_kb)

        talker.send_message(
          text: I18n.t('actions.users.preferences.show_options'),
          chat_id: chat_id,
          markup: markup
        )
      end

      def options_menu_inline_buttons
        options_kb = []

        Constants.options.each do |option_name|
          text = option_name.split('_').join(' ').capitalize
          callback = "preferences-#{option_name}-options_menu"
          options_kb << Telegram::Bot::Types::InlineKeyboardButton.new(text: text, callback_data: callback)
        end

        options_kb
      end
    end
  end
end
