class Questionnaire < ApplicationRecord
  validates :mobility, :self_care, :usual_activities, :pain, :anxiety, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  def qol_score
    health_state = 10000 * mobility + 1000 * self_care + 100 * usual_activities + 10 * pain + anxiety
    tariff = eval File.read( File.expand_path( "../hash_file/tariff.rb", __FILE__ ))
    tariff[health_state]
  end
end
