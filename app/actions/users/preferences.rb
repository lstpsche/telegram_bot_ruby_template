# frozen_string_literal: true

module Actions
  module Users
    class Preferences < Base
      # attrs from base -- :bot, :chat_id, :user

      # 'initialize' is in base

      def show
        show_options_menu
      end

      # 'back' is in base

      def setup_all
        setup_all_options
        save_validate_user { setup_successfull }
      end

      private

      # 'option_name' is in base

      def setup_all_options
        # setup all options one by one
        Constants.preferences_setup_options.each do |option|
          setup_option(option_name(option))
        end
      end
    end
  end
end
