# frozen_string_literal: true

module Helpers
  module Actions
    module Users
      module OptionsHelper
        def send_option_message(option_name, chat_id, markup = nil)
          message_text = I18n.t("actions.users.options.#{option_name}")
          talker.send_message(text: message_text, chat_id: chat_id, markup: markup)
        end
      end
    end
  end
end
