class AddManagerToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :manager, :boolean, default: false, null: false
  end
end
