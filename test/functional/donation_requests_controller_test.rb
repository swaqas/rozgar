require 'test_helper'

class DonationRequestsControllerTest < ActionController::TestCase
  setup do
    @donation_request = donation_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_request" do
    assert_difference('DonationRequest.count') do
      post :create, :donation_request => @donation_request.attributes
    end

    assert_redirected_to donation_request_path(assigns(:donation_request))
  end

  test "should show donation_request" do
    get :show, :id => @donation_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @donation_request.to_param
    assert_response :success
  end

  test "should update donation_request" do
    put :update, :id => @donation_request.to_param, :donation_request => @donation_request.attributes
    assert_redirected_to donation_request_path(assigns(:donation_request))
  end

  test "should destroy donation_request" do
    assert_difference('DonationRequest.count', -1) do
      delete :destroy, :id => @donation_request.to_param
    end

    assert_redirected_to donation_requests_path
  end
end
