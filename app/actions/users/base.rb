# frozen_string_literal: true

module Actions
  module Users
    class Base
      include Helpers::Common
      include Helpers::TalkerActions
      include Helpers::MenusActions
      include Helpers::Actions::UsersHelper

      attr_reader :bot, :chat_id, :user

      def initialize(bot:, user:)
        @bot = bot
        @user = user
        @chat_id = user.id
      end

      def show(args = {})
        before_show(args.fetch(:before, nil))

        send_or_edit_message(
          message_id: user.last_message_id,
          text: message_text, markup: create_markup(args.fetch(:markup_options, nil))
        )

        after_show(args.fetch(:after, nil))
      end

      def back
        set_replace_last_true
        show_main_menu
      end

      private

      def before_show(*args); end
      def after_show(*args); end

      def callback(command)
        command
      end

      def create_button(text, callback)
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text: text,
          callback_data: callback(callback)
        )
      end

      def create_markup(options)
        return unless options

        kb = []
        options.each do |option|
          kb << create_button(option_button(option), option_name(option))
        end

        Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
      end

      def message_text
        raise NotImplementedError
      end

      def option_button(option)
        option[:button]
      end

      def option_name(option)
        option[:name]
      end
    end
  end
end
