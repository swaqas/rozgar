require 'test_helper'

class DonationGrantsControllerTest < ActionController::TestCase
  setup do
    @donation_grant = donation_grants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donation_grants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donation_grant" do
    assert_difference('DonationGrant.count') do
      post :create, :donation_grant => @donation_grant.attributes
    end

    assert_redirected_to donation_grant_path(assigns(:donation_grant))
  end

  test "should show donation_grant" do
    get :show, :id => @donation_grant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @donation_grant.to_param
    assert_response :success
  end

  test "should update donation_grant" do
    put :update, :id => @donation_grant.to_param, :donation_grant => @donation_grant.attributes
    assert_redirected_to donation_grant_path(assigns(:donation_grant))
  end

  test "should destroy donation_grant" do
    assert_difference('DonationGrant.count', -1) do
      delete :destroy, :id => @donation_grant.to_param
    end

    assert_redirected_to donation_grants_path
  end
end
