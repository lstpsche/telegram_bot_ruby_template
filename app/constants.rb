# frozen_string_literal: true

class Constants
  def self.command_regex
    /^\/(\w+)$/
  end

  def self.context_command_regex
    /^(\w+)-(\w+)(-(\w+))?$/
  end

  def self.options
    [
      'example_option_1',
      'vegetarian'
    ]
  end

  def self.menu_options
    [
      'app',
      'preferences',
      'some example feature'
    ]
  end
end
