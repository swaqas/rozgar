require 'test_helper'

class LoanTransactionsControllerTest < ActionController::TestCase
  setup do
    @loan_transaction = loan_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loan_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loan_transaction" do
    assert_difference('LoanTransaction.count') do
      post :create, :loan_transaction => @loan_transaction.attributes
    end

    assert_redirected_to loan_transaction_path(assigns(:loan_transaction))
  end

  test "should show loan_transaction" do
    get :show, :id => @loan_transaction.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @loan_transaction.to_param
    assert_response :success
  end

  test "should update loan_transaction" do
    put :update, :id => @loan_transaction.to_param, :loan_transaction => @loan_transaction.attributes
    assert_redirected_to loan_transaction_path(assigns(:loan_transaction))
  end

  test "should destroy loan_transaction" do
    assert_difference('LoanTransaction.count', -1) do
      delete :destroy, :id => @loan_transaction.to_param
    end

    assert_redirected_to loan_transactions_path
  end
end
