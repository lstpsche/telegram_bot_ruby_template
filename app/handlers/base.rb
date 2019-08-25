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

    def user_registered?(id:)
      User.find_by(id: id) ? true : false
    end
  end
end
