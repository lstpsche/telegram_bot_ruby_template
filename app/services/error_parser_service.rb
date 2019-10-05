# frozen_string_literal: true

module Services
  class ErrorParserService < Base
    # attrs from base -- :bot, :chat_id, :user
    attr_reader :error

    def initialize(bot:, chat_id:, error:)
      @bot = bot
      @chat_id = chat_id
      @error = error
    end

    def handle_errors
      case error
      when 'Bad input'
        show_bad_input
      when 'Not understand'
        show_not_understand
      when 'No command'
        show_no_command
      when 'Not registered'
        show_not_registered
      else
        show_something_wrong
      end
    end
  end
end
