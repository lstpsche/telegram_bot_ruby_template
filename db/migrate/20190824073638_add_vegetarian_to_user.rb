class AddVegetarianToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :vegetarian, :boolean, null: false, default: false
  end
end
