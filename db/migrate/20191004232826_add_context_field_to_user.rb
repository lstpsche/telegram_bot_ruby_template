# frozen_string_literal: true

# All migrations should be stored at rails app

# Of course you can store them there, if you want your bot to be a standalone app

class AddContextFieldToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :context, :string
  end
end
