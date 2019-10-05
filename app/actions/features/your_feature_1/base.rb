# frozen_string_literal: true

module Actions
  module Features
    # TEMPLATE_TODO: rename this module and folder to match your feature name
    module YourFeature1
      class Base < Actions::Features::Base
        # attrs from base -- :bot, :chat_id, :user

        # TEMPLATE_TODO: all methods below can/should be overriden in child-classes
        # to specify your feature behaviour

        # TEMPLATE_TODO: you can add here your custom methods
        # for example, 'setup'

        # 'initialize' is in base
        # 'show' is in base
        # 'back' is in base

        private

        # TEMPLATE_TODO: all methods below can be overriden in child-classes
        # so you can specify your feature behaviour

        # 'before_show' is in base
        # 'after_show' is in base
        # 'callback' is in base
        # 'create_button' is in base
        # 'create_markup' is in base
        # 'message_text' is in base
        # 'option_button' is in base
        # 'option_name' is in base
      end
    end
  end
end
