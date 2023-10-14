require "test_helper"

class CurriculmLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get curriculm_logs_new_url
    assert_response :success
  end

  test "should get create" do
    get curriculm_logs_create_url
    assert_response :success
  end

  test "should get index" do
    get curriculm_logs_index_url
    assert_response :success
  end

  test "should get update" do
    get curriculm_logs_update_url
    assert_response :success
  end

  test "should get edit" do
    get curriculm_logs_edit_url
    assert_response :success
  end
end
