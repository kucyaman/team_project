require "test_helper"

class CurriculumLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get curriculum_logs_new_url
    assert_response :success
  end

  test "should get index" do
    get curriculum_logs_index_url
    assert_response :success
  end

  test "should get edit" do
    get curriculum_logs_edit_url
    assert_response :success
  end
end
