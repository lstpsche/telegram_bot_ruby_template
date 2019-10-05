# frozen_string_literal: true

module Helpers
  module TalkerActions
    #################### Setups ####################################

    def talker(bot = @bot, chat_id = @chat_id, user = @user)
      Talker.new(bot: bot, chat_id: chat_id, user: get_user(chat_id: chat_id))
    end

    ############## Sending--Editing--Getting #######################

    def get_message
      talker.get_message
    end

    # type should be 'message' or 'callback_query'
    def get_response_of_type(type)
      type = type.split('_').map(&:capitalize).join

      loop do
        response = get_message
        return response if response.class.name.demodulize == type
      end
    end

    def send_message(text:, markup: nil)
      talker.send_message(text: text, markup: markup)
    end

    def edit_message(message_id:, text:, markup: nil)
      talker.edit_message(message_id: message_id, text: text, markup: markup)
    end

    def edit_message_reply_markup(message_id:, reply_markup: nil)
      talker.edit_message_reply_markup(message_id: message_id, reply_markup: reply_markup)
    end

    def send_or_edit_message(message_id: nil, text: nil, markup: nil, parse_mode: 'markdown')
      talker.send_or_edit_message(message_id: message_id, text: text,
                                  markup: markup, parse_mode: parse_mode)
    end

    #################### Errors ####################################

    def show_new_schedule_error(error)
      talker.show_new_schedule_error(error)
    end

    def show_bad_input
      talker.show_bad_input
    end

    def show_no_command
      talker.show_no_command
    end

    def show_not_registered
      talker.show_not_registered
    end

    def show_not_understand
      talker.show_not_understand
    end

    def show_something_wrong
      talker.show_something_wrong
    end

    ##################### Other ####################################

    def show_help
      talker.show_help
    end

    def show_set_schedule_name_add_info
      message_text = I18n.t('services.new_schedule_creation.header') +
        I18n.t('services.new_schedule_creation.set_schedule_name_add_info')
      send_message(text: message_text)
    end

    def show_schedule_successfully_created
      message_text = I18n.t('services.new_schedule_creation.successfully_created')
      send_message(text: message_text)
    end
  end
end
