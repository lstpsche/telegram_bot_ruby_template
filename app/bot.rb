# frozen_string_literal: true

HANDLERS = {
  'Message' => Handlers::Messages::Base,
  'CallbackQuery' => Handlers::Callbacks::Base
}.freeze

class Bot
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def launch
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        parse_message_type(message)
      end
    end
  end

  def parse_message_type(message)
    message_class = message.class.to_s.split('::').last
    HANDLERS[message_class].new.(message)
  end
end
