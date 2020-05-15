class RemoveQolScoreFromQuestionnaires < ActiveRecord::Migration[6.0]
  def change

    remove_column :questionnaires, :qol_score, :decimal
  end
end
