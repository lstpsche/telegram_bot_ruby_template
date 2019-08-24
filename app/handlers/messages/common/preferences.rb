# frozen_string_literal: true

module Handlers
  module Messages
    module Common
      class Preferences < Base
        attr_reader :bot, :chat_id, :user, :options

        def initialize(bot:, chat_id:, user:)
          @bot = bot
          @chat_id = chat_id
          @options = Actions::Users::Options.new(bot: bot, chat_id: chat_id)
          @user = user
        end

        def call(command)
          options.send(command, user)
          show_successfully_setup
        end

        private

        def show_successfully_setup
          Talker.send_message(
            bot: bot,
            text: I18n.t('actions.users.options.setup_successful'),
            chat_id: chat_id,
            markup: 'remove'
          )
        end
      end
    end
  end
end
