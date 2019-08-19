# frozen_string_literal: true

module Handlers
  module Messages
    module Common
      COMMAND_REGEX = /^\/(\w+)$/

      class Base < Handlers::Base
        attr_reader :tg_user

        def initialize(tg_user:)
          @tg_user = tg_user
        end

        def call(command)
          command = command.match(COMMAND_REGEX)[1]

          send(command)
        end

        def method_missing(method_name, *args, &block)
          no_method
        end

        def start
          return false unless User.find_by(telegram_id: tg_user.id)

          Actions::User::Registration.new(user: tg_user).launch
        end

        def settings
          # if user is registered -- launch settings setup
          # else -- return false
        end

        def help
        end

        def no_method
        end
      end
    end
  end
end
