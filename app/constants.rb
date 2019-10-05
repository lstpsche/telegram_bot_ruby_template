# frozen_string_literal: true

class Constants
  class << self
    # REGEXES

    def command_regex
      /^\/(\w+)$/
    end

    def context_command_regex
      /^(\w+)-(\w+)(-(\w+))?$/
    end

    # OPTIONS

    def option_options
      scope = 'actions.users.option'

      options_translations_for(OPTION_OPTIONS, scope)
    end

    def preferences_options
      scope = 'actions.users.options'

      options_translations_for(PREFERENCES_OPTIONS, scope)
    end

    def preferences_setup_options
      # remove last 'option' which is actualy :back
      preferences_options[0..-2]
    end

    def menu_options
      scope = 'actions.features.menu'

      options_translations_for(MENU_OPTIONS, scope)
    end

    # TEMPLATE_TODO: add options for your features menus
    # for example:
    def subfeature_1_options
      ['one', 'two', 3, 4]
    end

    # CALLBACKS

    def main_menu_callback
      "menu-%{command}%{return_to}"
    end

    def option_callback
      "options-%{command}%{return_to}"
    end

    # TEMPLATE_TODO: add your menu buttons callbacks here
    # for example:
    def subfeature_1_callback
      "subfeature_1-%{command}%{return_to}"
    end

    # using for inner coding. no need to translate

    def text_commands
      [
        '/start',
        '/help'
        # TEMPLATE_TODO: add your custom common commands here
      ]
    end

    private

    def options_translations_for(options, scope)
      # returns hash: { name: '.....', text: '....' }
      options.map do |option|
        I18n.t(option, scope: scope)
      end
    end

    # OPTIONS LISTS

    MENU_OPTIONS = [
      :preferences
      # TEMPLATE_TODO: add Main Menu options here
    ]

    OPTION_OPTIONS = [
      :change_option,
      :back
    ]

    PREFERENCES_OPTIONS = [
      :example_option_1,
      # TEMPLATE_TODO: add custom user preferences here
      :back
    ]
  end
end
