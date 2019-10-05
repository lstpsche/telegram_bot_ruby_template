# frozen_string_literal: true

module Routers
  module Messages
    class TextCommandsRouter < Routers::Base
      # attrs from base -- :bot, :chat_id, :user
      attr_reader :command, :tg_user

      HANDLERS = {
        'start' => Handlers::TextCommands::StartHandler,
        'help' => Handlers::TextCommands::HelpHandler
        # TEMPLATE_TODO: add here your text commands handlers
      }

      # 'initialize' is in base

      def route(message)
        init_vars(message)
        raise validation_service.errors.first if validation_service.failure?

        actual_command = command.split('/').last

        HANDLERS[actual_command].new(bot: bot, chat_id: chat_id, user: user || tg_user).handle
      end

      private

      def init_vars(message)
        @command = message.text
        @tg_user = message.from
        @user = get_user(chat_id: tg_user.id)
        @chat_id = tg_user.id
      end

      def validation_service
        @validation_service ||= Services::TextCommandValidationService.new(bot: bot, chat_id: chat_id, command: command)
      end
    end
  end
end
