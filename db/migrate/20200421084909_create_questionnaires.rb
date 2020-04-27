class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.integer :mobility
      t.integer :self_care
      t.integer :usual_activities
      t.integer :pain
      t.integer :anxiety

      t.timestamps
    end
  end
end
