# frozen_string_literal: true

HANDLERS = {
  'Message' => Handlers::Messages::Base,
  'CallbackQuery' => Handlers::Callbacks::Base
}.freeze

class Bot
  attr_reader :bot, :token

  def initialize(token)
    @token = token
  end

  def launch
    Telegram::Bot::Client.run(token) do |bot|
      @bot = bot

      loop do
        message = Talker.get_message(bot: bot)
        parse_message_type(message)
      end
    end
  end

  def parse_message_type(message)
    message_class = message.class.to_s.split('::').last
    HANDLERS[message_class].new(bot: bot).(message)
  end
end
