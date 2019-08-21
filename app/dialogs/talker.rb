# frozen_string_literal: true

class Talker
  attr_reader :bot

  def initialize(bot:)
    @bot = bot
  end

  def send_message(text:, chat_id:, markup: nil)
    bot.api.send_message(chat_id: chat_id, text: text, reply_markup: markup)
  end
end
