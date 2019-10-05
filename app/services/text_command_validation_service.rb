# frozen_string_literal: true

module Services
  class TextCommandValidationService < Base
    # attrs from base -- :bot, :chat_id, :user
    attr_reader :command, :success, :errors

    alias :success? :success

    def initialize(bot:, chat_id:, command:)
      @bot = bot
      @chat_id = chat_id
      @command = command
      @errors = []
      @success = validate
    end

    def failure?
      !success
    end

    private

    def validate
      return bad_message unless message_valid
      return not_understand unless command_syntax_valid?
      return no_command unless command_exists?
      return not_registered if registration_needed?

      true
    end

    def message_valid
      not command.nil?
    end

    def command_syntax_valid?
      command.match(Constants.command_regex)
    end

    def command_exists?
      Constants.text_commands.include? command
    end

    def registration_needed?
      command != '/start' && !user_registered?(id: chat_id)
    end

    def bad_message
      errors << 'Bad input'
      false
    end

    def not_understand
      errors << 'Not understand'
      false
    end

    def no_command
      errors << 'No command'
      false
    end

    def not_registered
      errors << 'Not registered'
      false
    end
  end
end
