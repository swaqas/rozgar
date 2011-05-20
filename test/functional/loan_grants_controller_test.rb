require 'test_helper'

class LoanGrantsControllerTest < ActionController::TestCase
  setup do
    @loan_grant = loan_grants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_grants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_grant" do
    assert_difference('LoanGrant.count') do
      post :create, :loan_grant => @loan_grant.attributes
    end

    assert_redirected_to loan_grant_path(assigns(:loan_grant))
  end

  test "should show loan_grant" do
    get :show, :id => @loan_grant.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @loan_grant.to_param
    assert_response :success
  end

  test "should update loan_grant" do
    put :update, :id => @loan_grant.to_param, :loan_grant => @loan_grant.attributes
    assert_redirected_to loan_grant_path(assigns(:loan_grant))
  end

  test "should destroy loan_grant" do
    assert_difference('LoanGrant.count', -1) do
      delete :destroy, :id => @loan_grant.to_param
    end

    assert_redirected_to loan_grants_path
  end
end
