require "test_helper"

class Public::RecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_records_index_url
    assert_response :success
  end
end
