# frozen_string_literal: true

module Actions
  module Users
    class Preferences
      include Helpers::Actions::Users::PreferencesHelper

      attr_reader :bot, :chat_id, :talker, :user

      def initialize(bot:, chat_id:)
        @bot = bot
        @chat_id = chat_id
        @talker = Talker.new(bot: bot)
        @options = Options.new(bot: bot, chat_id: chat_id)
      end

      def setup(user_id)
        @user = User.find_by(id: user_id)

        Constants.options.each do |option_name|
          options.send(option_name, user)
        end

        if user.save
          setup_successfull
          # TODO: show 'successfully setup' WITH RemoveKeyboard markup
        else
          # TODO: show 'something's wrong'
          # TODO: handle this
        end
      end

      def show_options
        show_options_menu
      end
    end
  end
end
