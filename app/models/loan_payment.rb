class LoanPayment < ActiveRecord::Base
belongs_to :loan_grant
  validates_numericality_of :amount, :greater_than=>0
  validates_presence_of :amount, :applicant_id, :loan_grant_id
  validate :validate_amounts

after_save :update_amount_paid_back
after_destroy :update_amount_paid_back

  def validate_amounts
    lg=LoanGrant.find(loan_grant_id)
    errors.add( :amount, " cannot be greater than the loan itself") if lg.loan_amount<amount
    errors.add( :amount, " cannot be greater than the remaining loan amount") if loan_remaining_exclude(id)<amount
  end


  def self.total_loan_return
    LoanPayment.sum(:amount)
  end

  def loan_remaining_exclude payment_id
    if payment_id.nil? # incase on Insert new Loan Payment
       self.loan_grant.loan_amount - LoanPayment.where("loan_grant_id=?",loan_grant_id).sum(:amount) # Remaining loan amount calculated
    else # incase of Edit old Loan Payment
       self.loan_grant.loan_amount - (LoanPayment.where("loan_grant_id=?",loan_grant_id).sum(:amount) - LoanPayment.find(payment_id).amount)
    end

  end


  protected
  def update_amount_paid_back
    tlp=LoanPayment.where("loan_grant_id = ?", loan_grant_id).sum(:amount)
    lg=LoanGrant.find(loan_grant_id)
    lg.returned_amount=tlp
    lg.save
  end
end
