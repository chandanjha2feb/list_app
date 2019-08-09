require 'test_helper'

class TrashControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trash_index_url
    assert_response :success
  end

end
