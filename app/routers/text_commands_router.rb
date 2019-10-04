# frozen_string_literal: true

module Routers
  class TextCommandsRouter < Base
    # attrs from base -- :bot, :chat_id, :user
    attr_reader :command, :tg_user

    # 'initialize' is in base

    def route(message)
      init_vars(message)
      raise validation_service.errors.first if validation_service.failure?

      actual_command = command.split('/').last

      case actual_command
      when 'start'
        if user_registered?(id: chat_id)
          set_replace_last_false
          show_main_menu
        else
          launch_registration
        end
      when 'help'
        set_replace_last_false
        show_help
      end
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
