# frozen_string_literal: true

module Actions
  module Users
    class Registration
      attr_reader :tg_user, :user

      def initialize(tg_user:)
        @tg_user = tg_user
      end

      def launch
        @user = DB.create_user(tg_user: tg_user)
        binding.pry
        # send welcome message
        # launch options setup (Preferences#setup)
      end

      private


    end
  end
end
