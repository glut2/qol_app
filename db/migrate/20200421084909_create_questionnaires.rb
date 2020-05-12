class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.integer :mobility, null: false
      t.integer :self_care, null: false
      t.integer :usual_activities, null: false
      t.integer :pain, null: false
      t.integer :anxiety, null: false

      t.timestamps
    end
  end
end
