require 'test_helper'

class ChronologyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chronology_index_url
    assert_response :success
  end

end
