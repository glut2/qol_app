require 'test_helper'

class Manager::QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  test "should get manage" do
    get manager_questionnaires_manage_url
    assert_response :success
  end

end
