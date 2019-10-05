# frozen_string_literal: true

module Actions
  module Features
    module YourFeature1
      class Subfeature1 < Base
        # attrs from base -- :bot, :chat_id, :user
        attr_reader :some_attr

        def initialize(bot:, user:, some_attr:)
          super(bot: bot, user: user)
          @some_attr = some_attr
        end

        def show
          params = {
            before: { attr: some_attr },
            markup_option: Constants.subfeature_1_options,
            after: { attr: some_attr }
          }

          super(params)
        end

        # 'show' is in base

        def back
          show_main_menu
          set_replace_last_true
        end

        private

        def before_show(*args)
          puts "R E N D E R before_show for subfeature_1... given attr = #{args[:attr]}"
        end

        def after_show(*args)
          puts "R E N D E R after_show for subfeature_1... given attr = #{args.fetch(:attr, 'no attr given')}"
        end

        def callback(command)
          Constants.subfeature_1_callback % { command: command }
        end

        # 'create_button' is in base
        # 'create_markup' is in base

        def message_text
          'Message text for Subfeature 1'
        end

        # 'option_button' is in base
        # 'option_name' is in base
      end
    end
  end
end
