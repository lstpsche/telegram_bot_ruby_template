# frozen_string_literal: true

module Handlers
  module TextCommands
    class HelpHandler < Base
      # attrs from base -- :bot, :chat_id, :user

      # 'initialize' is in base

      def handle
        set_replace_last_false
        show_help
      end
    end
  end
end
