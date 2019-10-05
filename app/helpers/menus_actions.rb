# frozen_string_literal: true

module Helpers
  module MenusActions
    def launch_registration
      ::Actions::Users::Registration.new(bot: bot, tg_user: tg_user).launch
    end

    ################# Main Menu ####################################

    def show_main_menu
      ::Actions::Features::Menu.new(bot: bot, user: user).show
    end

    # TEMPLATE_TODO: add here your features calling
    def show_subfeature
      ::Actions::Features::YourFeature1::YourSubfeature1.new(bot: bot, user: user, some_attr: 'attr').show
    end

    def show_preferences
      ::Actions::Users::Preferences.new(bot: bot, user: user).show
    end

    ################# Preferences ##################################

    def setup_all_preferences
      ::Actions::Users::Preferences.new(bot: bot, user: user).setup_all
    end

    def show_option(option_name)
      ::Actions::Users::Option.new(bot: bot, user: user).show(option_name)
    end

    ################# Preferences > Options ########################

    def setup_option(option_name)
      ::Services::OptionSetupService.new(bot: bot, user: user).perform(option_name)
    end

    def call_back_option
      ::Actions::Users::Option.new(bot: bot, user: user).back
    end

    ################ Your classes here #############################
    # TEMPLATE_TODO: place here calls of all your classes menus
  end
end
