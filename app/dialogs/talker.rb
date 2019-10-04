# frozen_string_literal: true

class Talker
  include Helpers::Common

  attr_reader :bot, :chat_id, :user

  def initialize(bot:, chat_id: nil, user: nil)
    @bot = bot
    @chat_id = chat_id || user&.id
    @user = user || get_user(chat_id: chat_id)
  end

  ############## Sending--Editing--Getting #######################

  def get_message
    bot.listen { |message| return message }
  end

  def send_message(text:, markup: nil, parse_mode: 'markdown')
    markup = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true) if markup == 'remove'

    msg = bot.api.send_message(chat_id: chat_id, text: text, reply_markup: markup, parse_mode: parse_mode)
    user&.update(last_message: msg)
  end

  def edit_message(message_id:, text: nil, markup: nil, parse_mode: 'markdown')
    text && bot.api.edit_message_text(chat_id: chat_id, message_id: message_id, text: text, parse_mode: parse_mode)
    markup && bot.api.edit_message_reply_markup(chat_id: chat_id, message_id: message_id, reply_markup: markup)
  end

  def edit_message_reply_markup(message_id:, reply_markup: nil)
    bot.api.edit_message_reply_markup(chat_id: chat_id, message_id: message_id, reply_markup: reply_markup)
  end

  def send_or_edit_message(message_id: nil, text: nil, markup: nil, parse_mode: 'markdown')
    if user&.replace_last_message?
      edit_message(message_id: message_id, text: text, markup: markup, parse_mode: parse_mode)
    else
      send_message(text: text, markup: markup, parse_mode: parse_mode)
    end
  end

  ################ Common commands ###############################

  def show_help
    send_message(text: I18n.t('common.help'))
  end

  #################### Errors ####################################

  def show_new_schedule_error(error)
    text = I18n.t('services.new_schedule_creation.schedule_fill.input_invalid') % { error: error }
    send_message(text: text)
    set_replace_last_false
  end

  def show_bad_input
    send_message(text: I18n.t('errors.bad_input'))
  end

  def show_no_command
    send_message(text: I18n.t('errors.no_command'))
    set_replace_last_false
  end

  def show_not_registered
    send_message(text: I18n.t('errors.not_registered'))
  end

  def show_not_understand
    send_message(text: I18n.t('errors.not_understand'))
    set_replace_last_false
  end

  def show_something_wrong
    send_message(text: I18n.t('errors.something_wrong'))
    set_replace_last_false
  end
end
