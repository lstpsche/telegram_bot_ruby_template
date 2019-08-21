# frozen_string_literal: true

module Handlers
  module Messages
    module Text
      class Base
        attr_reader :bot

        def initialize(bot:)
          @bot = bot
        end

        def call(message_text)
        end
      end
    end
  end
end
