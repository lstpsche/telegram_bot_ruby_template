# frozen_string_literal: true

module Handlers
  module Callbacks
    class Base
      include Helpers::Common
      include Helpers::MenusActions
      include Helpers::TalkerActions

      attr_reader :bot, :chat_id, :user, :talker

      def initialize(bot:, user:)
        @bot = bot
        @chat_id = user.id
        @user = user
        yield if block_given?
      end
    end
  end
end
