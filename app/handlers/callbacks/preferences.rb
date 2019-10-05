# frozen_string_literal: true

module Handlers
  module Callbacks
    class Preferences < Base
      # attrs from base -- :bot, :chat_id, :user, :talker

      # 'initialize' is in base

      def handle(command)
        Routers::OptionsRouter.new(bot: bot, user: user).route(command)
      end
    end
  end
end
