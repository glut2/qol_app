class AddUserIdToQuestionnaires < ActiveRecord::Migration[6.0]
  def up
    execute 'DELETE FROM questionnaires;'
    add_reference :questionnaires, :user, null: false, index: true
  end

  def down
    remove_reference :questionnaires, :user, index: true
  end
end
