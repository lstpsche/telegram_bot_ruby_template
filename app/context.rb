# frozen_string_literal: true

class Context
  def self.init
    @@context ||= {}
    User.all.pluck(:tg_id).each do |user_tg_id|
      @@context[user_tg_id] ||= 'main_menu'
    end
  end

  def self.set(user_tg_id, context)
    @@context[user_tg_id] = context
  end

  def self.get(user_tg_id)
    context = @@context[user_tg_id]
    context.empty? ? '' : context
  end
end
