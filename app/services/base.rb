# frozen_string_literal: true

module Services
  class Base
    include Helpers::Common
    include Helpers::MenusActions
    include Helpers::TalkerActions

    attr_reader :bot, :chat_id, :user

    def initialize(bot:, user:)
      @bot = bot
      @user = user
      @chat_id = user.id
      yield if block_given?
    end
  end
end
