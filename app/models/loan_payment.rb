class LoanPayment < ActiveRecord::Base
validates_numericality_of :amount
  validates_presence_of :amount, :applicant_id, :loan_grant_id


  def self.total_loan_return
    payment=LoanPayment.sum(:amount)
  end
end
