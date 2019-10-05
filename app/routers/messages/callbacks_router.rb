# frozen_string_literal: true

module Routers
  module Messages
    class CallbacksRouter < Routers::Base
      # attrs from base -- :bot, :chat_id, :user
      attr_reader :params

      HANDLERS = {
        'menu' => Handlers::Callbacks::Menu,
        'options' => Handlers::Callbacks::Options,
        'preferences' => Handlers::Callbacks::Preferences
        # TEMPLATE_TODO: Add your handlers here
      }

      def initialize(bot:)
        super do
          @params = {}
        end
      end

      def route(callback)
        init_vars(callback)

        call_handler
        return_to_context
      end

      private

      def init_vars(callback)
        @user_id = callback.from.id
        @tapped_message = callback.message
        @chat_id = callback.from.id
        @user = get_user(chat_id: chat_id)
        parse_callback(callback.data)
      end

      def parse_callback(command)
        # /^(\w+)-(\w+)(-(\w+))?$/
        parsed_command = command.match(Constants.context_command_regex)

        params[:handler_class] = parsed_command[1]
        params[:command] = parsed_command[2]
        params[:return_to] = parsed_command[4]
      end

      def call_handler
        HANDLERS[params[:handler_class]].new(bot: bot, user: user).handle(params[:command])
      end

      # Almost deprecated
      def return_to_context
        case params[:return_to]
        when 'options_menu'
          show_preferences
        when 'main_menu'
          show_main_menu
        end
      end
    end
  end
end
