require 'test_helper'

class LoanPaymentsControllerTest < ActionController::TestCase
  setup do
    @loan_payment = loan_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_payment" do
    assert_difference('LoanPayment.count') do
      post :create, :loan_payment => @loan_payment.attributes
    end

    assert_redirected_to loan_payment_path(assigns(:loan_payment))
  end

  test "should show loan_payment" do
    get :show, :id => @loan_payment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @loan_payment.to_param
    assert_response :success
  end

  test "should update loan_payment" do
    put :update, :id => @loan_payment.to_param, :loan_payment => @loan_payment.attributes
    assert_redirected_to loan_payment_path(assigns(:loan_payment))
  end

  test "should destroy loan_payment" do
    assert_difference('LoanPayment.count', -1) do
      delete :destroy, :id => @loan_payment.to_param
    end

    assert_redirected_to loan_payments_path
  end
end
