# frozen_string_literal: true

module Handlers
  module TextCommands
    class Base
      include Helpers::Common
      include Helpers::MenusActions
      include Helpers::TalkerActions

      attr_reader :bot, :chat_id, :user

      def initialize(bot:, chat_id:, user:)
        @bot = bot
        @chat_id = user.id
        @user = user
        yield if block_given?
      end
    end
  end
end
