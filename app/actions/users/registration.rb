# frozen_string_literal: true

module Actions
  module Users
    class Registration
      attr_reader :bot, :tg_user, :user, :talker

      def initialize(bot:, tg_user:)
        @bot = bot
        @tg_user = tg_user
        @talker = Talker.new(bot: bot)
      end

      def launch
        @user = DB.create_user(tg_user: tg_user)
        talker.send_message(
          text: I18n.t('actions.users.registration.welcome') % {name: user.first_name},
          chat_id: user.tg_id
        )
        binding.pry
        # send welcome message
        # launch options setup (Preferences#setup)
      end
    end
  end
end
