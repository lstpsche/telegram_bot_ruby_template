# frozen_string_literal: true

module Helpers
  module Actions
    module Users
      module PreferencesHelper
        def send_option_message(option_name, markup = nil)
          message_text = I18n.t("actions.users.preferences.#{option_name}")
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
          # metaprogram automatic adding all options here
          options_kb = [
            Telegram::Bot::Types::InlineKeyboardButton.new(text: '', callback_data: ''),
          ]
          talker.send_message(
            text: I18n.t('actions.users.preferences.show_options'),
            chat_id: chat_id,
            markup: options_kb
          )
        end
      end
    end
  end
end
