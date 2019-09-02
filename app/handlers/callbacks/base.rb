# frozen_string_literal: true

module Handlers
  module Callbacks
    class Base < Handlers::Base
      attr_reader :bot, :parsed_command, :user_id

      def initialize(bot:)
        @bot = bot
      end

      def call(callback)
        init_vars(callback)
        parse_context_command(callback.data)

        call_handler(parsed_command[2])

        return_to_context(parsed_command[4])
      end

      private

      def init_vars(callback)
        @user_id = callback.from.id
      end

      def parse_context_command(command)
        @parsed_command = command.match(Constants.context_command_regex) # /^(\w+)-(\w+)(-(\w+))?$/
        # 1: class (ex. preferences)     2: command     3: context with "-" sign before     4: context (ex. main_menu)
      end

      def call_handler(command)
        option_klass = parsed_command[1]
        handler = "Handlers::Messages::Common::#{option_klass.capitalize}".split('::').reduce(Module, :const_get)

        handler.new(bot: bot, chat_id: user_id, user: User.find_by(id: user_id)).(command)
      end

      def return_to_context(context)
        case context
        when 'options_menu'
          show_options_menu
        when 'main_menu'
          show_main_menu
        end
      end

      def show_options_menu
        Actions::Users::Preferences.new(bot: bot, chat_id: user_id).show_options_menu
      end

      def show_main_menu
        Actions::Features::Menu.new(bot: bot).show(chat_id: user_id)
      end
    end
  end
end
