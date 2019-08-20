# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :tg_id, presence: true
end
