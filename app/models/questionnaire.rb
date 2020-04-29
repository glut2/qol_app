class Questionnaire < ApplicationRecord
  validates :mobility, :self_care, :usual_activities, :pain, :anxiety, inclusion: {in: 1..5 }
end
