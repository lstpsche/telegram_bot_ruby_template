# frozen_string_literal: true

module Handlers
  module TextCommands
    class StartHandler < Base
      # attrs from base -- :bot, :chat_id, :user

      # 'initialize' is in base

      def handle
        if user_registered?(id: chat_id)
          set_replace_last_false
          show_main_menu
        else
          launch_registration
        end
      end
    end
  end
end
