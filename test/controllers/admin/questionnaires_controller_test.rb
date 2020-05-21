require 'test_helper'

class Admin::QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  test "should get administrate" do
    get admin_questionnaires_administrate_url
    assert_response :success
  end

end
