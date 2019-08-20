# frozen_string_literal: true

module Actions
  module User
    class Registration
      attr_reader :tg_user, :user

      def initialize(tg_user:)
        @tg_user = tg_user
      end

      def launch
        create_user
        # send welcome message
        # launch options setup (Preferences#setup)
      end

      private

      def create_user
        @user = User.create(
          tg_id: tg_user.id,
          first_name: tg_user.first_name,
          last_name: tg_user.last_name,
          username: tg_user.username,
          language_code: tg_user.language_code
        )
      end
    end
  end
end
