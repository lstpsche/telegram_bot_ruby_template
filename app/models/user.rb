# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :telegram_id, presence: true
end
