class LoanMonthlyPaymentController < ApplicationController
  def index
    #@applicants_with_loans = LoanGrant.list
    @applicants_with_loans = Applicant.all
  end

  def update

    ai=params[:applicant_id]
    lgi=params[:loan_grant_id]

    if  !lgi.nil? and !lgi.blank? and !ai.nil? and !ai.blank? 

      loan_payment = LoanPayment.find_all_by_applicant_id_and_loan_grant_id(ai.to_i,lgi.to_i).last

      if loan_payment.nil? or !(loan_payment.created_at.month==Date.today.month and loan_payment.created_at.year==Date.today.year)
        loan_payment=LoanPayment.new
        loan_payment.amount=params[:instalment_amount]
        loan_payment.loan_grant_id=lgi
        loan_payment.applicant_id=ai
        loan_payment.save
      else
          loan_payment.amount=params[:instalment_amount]
          loan_payment.save
      end
    end
    
    redirect_to :action=>:index
  end


end
