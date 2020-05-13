class AddQolScoreToQuestionnaire < ActiveRecord::Migration[6.0]
  def change
    add_column :questionnaires, :qol_score, :decimal, precision: 4, scale: 3
  end
end
