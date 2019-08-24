# frozen_string_literal: true

module Handlers
  class Base
    def initialize
    end

    def method_missing(method_name, *args, &block)
      no_method
    end

    def no_method
    end

    def user_registered?(tg_id:)
      User.find_by(tg_id: tg_id) ? true : false
    end
  end
end
