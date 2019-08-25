# frozen_string_literal: true

class Context
  def self.init
    @@context ||= {}
    User.all.pluck(:id).each do |user_id|
      @@context[user_id] ||= 'main_menu'
    end
  end

  def self.set(user_id, context)
    @@context[user_id] = context
  end

  def self.get(user_id)
    context = @@context[user_id]
    context.empty? ? '' : context
  end
end
