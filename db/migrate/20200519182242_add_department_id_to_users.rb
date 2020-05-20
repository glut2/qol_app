class AddDepartmentIdToUsers < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM users;'
    add_reference :users, :department, null: false, index: true
  end

  def down
    remove_reference :users, :department, index: true
  end
end
