require 'test_helper'

class Site::DynamicsControllerTest < ActionController::TestCase
  test "should get contribution" do
    get :contribution
    assert_response :success
  end

end
