require 'test_helper'

class ListitemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get listitems_index_url
    assert_response :success
  end

  test "should get new" do
    get listitems_new_url
    assert_response :success
  end

  test "should get create" do
    get listitems_create_url
    assert_response :success
  end

  test "should get show" do
    get listitems_show_url
    assert_response :success
  end

  test "should get update" do
    get listitems_update_url
    assert_response :success
  end

  test "should get delete" do
    get listitems_delete_url
    assert_response :success
  end

end
