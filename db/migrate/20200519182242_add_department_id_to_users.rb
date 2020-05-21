class AddDepartmentIdToUsers < ActiveRecord::Migration[6.0]
  def up
    add_reference :users, :department, null: false, index: true
  end

  def down
    remove_reference :users, :department, index: true
  end
end
