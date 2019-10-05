# frozen_string_literal: true

module Actions
  module Users
    class Registration < Base
      # attrs from base -- :bot, :chat_id, :user
      attr_reader :tg_user

      def initialize(bot:, tg_user:)
        @bot = bot
        @tg_user = tg_user
        @chat_id = tg_user.id
      end

      # TEMPLATE_TODO: you can override 'show' method to do, what you want registration to do
      # pay attention to 'before_show' and 'after_show' methods

      # 'show' is in base

      alias :launch :show

      # Registration has no 'back' button
      def back
        raise NoMethodError
      end

      private

      def before_show(*args)
        @user = DB.create_user(tg_user: tg_user)
        set_replace_last_false
      end

      def after_show(*args)
        setup_all_preferences
        show_main_menu
      end

      def message_text
        I18n.t('actions.users.registration.welcome') % { name: user.first_name }
      end
    end
  end
end
