# frozen_string_literal: true

# All migrations should be stored at rails app

# Of course you can store them there, if you want your bot to be a standalone app

class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :username, null: false, default: ''
      t.string :language_code, null: false, default: 'en'

      t.timestamps
    end
  end
end
