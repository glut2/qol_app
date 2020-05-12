class AddQolScoreToQuestionnaire < ActiveRecord::Migration[6.0]
  def change
    add_column :questionnaires, :qol_score, :float
  end
end
