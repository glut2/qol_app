require 'test_helper'

class QuestionnairesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get questionnaires_index_url
    assert_response :success
  end

  test "should get show" do
    get questionnaires_show_url
    assert_response :success
  end

  test "should get new" do
    get questionnaires_new_url
    assert_response :success
  end

  test "should get edit" do
    get questionnaires_edit_url
    assert_response :success
  end

end
