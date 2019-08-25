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
