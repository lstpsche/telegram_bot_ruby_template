# frozen_string_literal: true

module Routers
  module Features
    class OptionsRouter < Base
      # attrs from base -- :bot, :chat_id, :user

      def initialize(bot:, user: nil)
        super(bot: bot) do
          @user = user
          @chat_id = user.id
        end
      end

      def route(command)
        action, option_name = command.split('_', 2)

        case action
        when 'show'
          option_name == 'back' ? back : show(option_name)
        when 'setup'
          setup(option_name)
        end
      end

      def show(option_name)
        show_option(option_name)
      end

      def setup(option_name)
        setup_option(option_name)

        set_replace_last_false
        show_option(option_name)
      end

      def back
        show_main_menu
      end
    end
  end
end
