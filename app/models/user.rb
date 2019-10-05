# frozen_string_literal: true

class User < ActiveRecord::Base
  serialize :context, ::Serializers::HashSerializer
  store_accessor :context, :last_message, :replace_last_message, :return_to
  has_many :schedule_users
  has_many :schedules, through: :schedule_users

  def method_missing(method_name, *args, &block)
    nil
  end

  # message.message.message_id — получить id сообщения, от которого пришёл callback
  # TODO:
  # 1) сохранять _message.message_ в user.context['tapped_message'] (будет доступно по user.tapped_message)
  # 2) при эдите сообщения, эдитить не последнее, а tapped_message

  def empty_context
    {
      'last_message' => {
        'result' => {
          'message_id' => nil
        }
      },
      'replace_last_message' => false,
      'return_to' => nil
    }
  end

  def context
    super.empty? ? empty_context : super
  end

  def last_message
    context['last_message']
  end

  def last_message_id
    last_message['result']['message_id']
  end

  def replace_last_message?
    context['replace_last_message']
  end

  def return_to
    context['return_to']
  end

  class << self
    def registered?(id:)
      find_by(id: id).present?
    end
  end
end
