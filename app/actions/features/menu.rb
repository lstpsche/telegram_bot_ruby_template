# frozen_string_literal: true

module Actions
  module Features
    class Menu < Base
      # attrs from base -- :bot, :chat_id, :user

      # 'initialize' is in base
      # 'show' is in base

      def show
        params = {
          markup_options: Constants.menu_options
        }

        super(params)
      end

      # there is no 'back' in Main Menu
      def back
        raise NoMethodError
      end

      private

      def after_show(*args)
        set_replace_last_true
      end

      def callback(command)
        Constants.main_menu_callback % {
          command: command,
          return_to: nil
        }
      end

      # create_button is in base
      # create_markup is in base

      def message_text
        I18n.t('actions.features.menu.header')
      end

      # option_button is in base
      # option_name is in base
    end
  end
end
