# frozen_string_literal: true

ROUTERS = {
  'Message' => Routers::Messages::TextCommandsRouter,
  'CallbackQuery' => Routers::Messages::CallbacksRouter
}.freeze

class Bot
  attr_reader :bot, :token

  def initialize(token)
    @token = token
  end

  def launch
    Telegram::Bot::Client.run(token) do |bot|
      @bot = bot
      talker = Talker.new(bot: bot)

      loop do
        message = talker.get_message
        # binding.pry
        parse_message_type(message)
      rescue => error
        Services::ErrorParserService.new(bot: bot, chat_id: message.from.id, error: error.to_s).handle_errors
      end
    end
  end

  private

  def parse_message_type(message)
    # maybe handle errors which are returned from this route()
    # errors are returned only from text commands now
    ROUTERS[message.class.name.demodulize].new(bot: bot).route(message)
  end
end
