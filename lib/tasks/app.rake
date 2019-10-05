# frozen_string_literal: true

namespace :app do
  desc 'Initialize app and setup it'
  task 'init' do
    config = 'db/config.yml.example'
    env = '.env.example'

    config_dest = 'db/config.yml'
    env_dest = '.env'

    FileUtils.cp(config, config_dest)
    FileUtils.cp(env, env_dest)
  end
end
