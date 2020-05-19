class Questionnaire < ApplicationRecord
  validates :mobility, :self_care, :usual_activities, :pain, :anxiety, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to :user
end
