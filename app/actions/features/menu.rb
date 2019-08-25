# frozen_string_literal: true

module Actions
  module Features
    class Menu < Base
      attr_reader :bot, :chat_id, :talker

      def initialize(bot:)
        @bot = bot
        @talker = Talker.new(bot: bot)
      end

      def show(chat_id:)
        @chat_id = chat_id

        menu_options_kb = []
        Constants.menu_options.each do |menu_option_name|
          menu_options_kb << Telegram::Bot::Types::InlineKeyboardButton.new(
            text: menu_option_name.capitalize,
            callback_data: "menu-#{menu_option_name.split(' ').join('_')}-main_menu"
          )
        end
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: menu_options_kb)

        talker.send_message(text: I18n.t('actions.features.menu.text'), chat_id: chat_id, markup: markup)
      end
    end
  end
end
