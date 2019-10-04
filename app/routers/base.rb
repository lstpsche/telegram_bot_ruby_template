# frozen_string_literal: true

module Routers
  class Base
    include Helpers::Common
    include Helpers::TalkerActions
    include Helpers::MenusActions

    attr_reader :bot, :chat_id, :user

    def initialize(bot:)
      @bot = bot
      yield if block_given?
    end
  end
end
