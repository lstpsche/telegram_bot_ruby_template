class AddContextFieldToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contex, :string
  end
end
