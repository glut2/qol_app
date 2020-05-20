require 'test_helper'

class Admin::DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_departments_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_departments_edit_url
    assert_response :success
  end

  test "should get show" do
    get admin_departments_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_departments_index_url
    assert_response :success
  end

end
