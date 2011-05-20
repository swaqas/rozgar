require 'test_helper'

class GuarantorsControllerTest < ActionController::TestCase
  setup do
    @guarantor = guarantors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guarantors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guarantor" do
    assert_difference('Guarantor.count') do
      post :create, :guarantor => @guarantor.attributes
    end

    assert_redirected_to guarantor_path(assigns(:guarantor))
  end

  test "should show guarantor" do
    get :show, :id => @guarantor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @guarantor.to_param
    assert_response :success
  end

  test "should update guarantor" do
    put :update, :id => @guarantor.to_param, :guarantor => @guarantor.attributes
    assert_redirected_to guarantor_path(assigns(:guarantor))
  end

  test "should destroy guarantor" do
    assert_difference('Guarantor.count', -1) do
      delete :destroy, :id => @guarantor.to_param
    end

    assert_redirected_to guarantors_path
  end
end
