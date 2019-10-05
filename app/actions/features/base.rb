# frozen_string_literal: true

module Actions
  module Features
    class Base
      include Helpers::Common
      include Helpers::TalkerActions
      include Helpers::MenusActions

      attr_reader :bot, :chat_id, :user

      # TEMPLATE_TODO: all methods below can/should be overriden in child-classes
      # to specify your feature behaviour

      def initialize(bot:, user:)
        @bot = bot
        @user = user
        @chat_id = user.id
      end

      def show(args = {})
        before_show(args[:before])

        send_or_edit_message(
          message_id: user.last_message_id,
          text: message_text, markup: crate_markup(args.fetch(:markup_options, nil))
        )

        after_show(args[:after])
      end

      # TEMPLATE_TODO: override this method in child classes if needed
      def back
        # TEMPLATE_TODO: set here what 'back' button should do
      end

      private

      # TEMPLATE_TODO: all methods below can be overriden in child-classes
      # so you can specify your feature behaviour

      def before_show(*args); end
      def after_show(*args); end

      def callback(command)
        command
      end

      def create_button(text, command)
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text: text,
          callback_data: callback(command)
        )
      end

      def create_markup(options)
        return unless options

        kb = []
        options.each do |option|
          kb << create_button(option_button(option), option_name(option))
        end
        kb << yield if block_given?

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
