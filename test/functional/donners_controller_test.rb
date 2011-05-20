require 'test_helper'

class DonnersControllerTest < ActionController::TestCase
  setup do
    @donner = donners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donner" do
    assert_difference('Donner.count') do
      post :create, :donner => @donner.attributes
    end

    assert_redirected_to donner_path(assigns(:donner))
  end

  test "should show donner" do
    get :show, :id => @donner.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @donner.to_param
    assert_response :success
  end

  test "should update donner" do
    put :update, :id => @donner.to_param, :donner => @donner.attributes
    assert_redirected_to donner_path(assigns(:donner))
  end

  test "should destroy donner" do
    assert_difference('Donner.count', -1) do
      delete :destroy, :id => @donner.to_param
    end

    assert_redirected_to donners_path
  end
end
