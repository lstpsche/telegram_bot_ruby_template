# frozen_string_literal: true

class DB
  class << self
    def create_user(args)
      tg_user = args.fetch(:tg_user, nil)
      return false unless tg_user || args.fetch(:id, nil)

      User.create(
        id: tg_user.id || args.fetch(:id, nil),
        first_name: tg_user&.first_name || args.fetch(:first_name, ''),
        last_name: tg_user&.last_name || args.fetch(:last_name, ''),
        username: tg_user&.username || args.fetch(:username, ''),
        language_code: tg_user&.language_code || args.fetch(:language_code, 'en')
      )
    end
  end
end
