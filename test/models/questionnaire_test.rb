require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase

  def setup
    @newquestionnaire = Questionnaire.new
  end

  test "substitute -1 for mobility" do
    @newquestionnaire.mobility = -1
    @newquestionnaire.self_care = 1
    @newquestionnaire.usual_activities = 1
    @newquestionnaire.pain = 1
    @newquestionnaire.anxiety = 1
    assert_not @newquestionnaire.valid?
  end

  test "substitute 0 for mobility" do
    @newquestionnaire.mobility = 0
    @newquestionnaire.self_care = 1
    @newquestionnaire.usual_activities = 1
    @newquestionnaire.pain = 1
    @newquestionnaire.anxiety = 1
    assert_not @newquestionnaire.valid?
  end

  test "substitute 1 for all variables" do
    @newquestionnaire.mobility = 1
    @newquestionnaire.self_care = 1
    @newquestionnaire.usual_activities = 1
    @newquestionnaire.pain = 1
    @newquestionnaire.anxiety = 1
    assert @newquestionnaire.valid?
  end

  test "substitute vaild scores for each column" do
    @newquestionnaire.mobility = 3
    @newquestionnaire.self_care = 2
    @newquestionnaire.usual_activities = 4
    @newquestionnaire.pain = 1
    @newquestionnaire.anxiety = 5
    assert @newquestionnaire.valid?
  end

  test "substitute 3.5 for mobility" do
    @newquestionnaire.mobility = 3.5
    @newquestionnaire.self_care = 1
    @newquestionnaire.usual_activities = 5
    @newquestionnaire.pain = 4
    @newquestionnaire.anxiety = 3
    assert_not @newquestionnaire.valid?
  end

  test "substitute nil for pain" do
    @newquestionnaire.mobility = 5
    @newquestionnaire.self_care = 3
    @newquestionnaire.usual_activities = 4
    @newquestionnaire.pain = nil
    @newquestionnaire.anxiety = 2
    assert_not @newquestionnaire.valid?
  end

  test "substitute 6 for anxiety" do
    @newquestionnaire.mobility = 2
    @newquestionnaire.self_care = 3
    @newquestionnaire.usual_activities = 3
    @newquestionnaire.pain = 3
    @newquestionnaire.anxiety = 6
    assert_not @newquestionnaire.valid?
  end

end
