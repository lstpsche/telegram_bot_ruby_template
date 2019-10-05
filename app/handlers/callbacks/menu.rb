# frozen_string_literal: true

module Handlers
  module Callbacks
    class Menu < Base
      # attrs from base -- :bot, :chat_id, :user

      # 'initialize' is in base

      # TEMPLATE_TODO: add here methods to use them in 'handle' down below

      def show_preferences_menu
        return false if not_registered_user(id: chat_id)

        show_preferences
      end

      def handle(command)
        case command
        when 'preferences'
          show_preferences_menu
        # TEMPLATE_TODO: add here your callbacks routes
        end
      end

      private

      def not_registered_user(id:)
        unless user_registered?(id: id)
          show_not_registered(chat_id: id)
          return true
        end

        false
      end
    end
  end
end
