class LoanGrant < ActiveRecord::Base
belongs_to :applicant
has_many :loan_payments
validates_presence_of :loan_amount, :instalment_amount, :applicant_id
validates_numericality_of :loan_amount, :instalment_amount, :greater_than=>0
validate :validate_amounts

  def validate_amounts
    errors.add(:instalment_amount, " cannot be greater than the loan itself") if loan_amount<instalment_amount
    errors.add(:loan_amount, " cannot be changed to less than the already paid amount") if !is_updateable?
  end

    def self.total_grant
      LoanGrant.sum(:loan_amount)
    end

    def self.total_defaulter
      LoanGrant.where("defaulter=true").sum(:loan_amount)-LoanGrant.where("defaulter=true").sum(:returned_amount)
    end

    def self.list
      Applicant.joins(:loan_grants)
    end

    def this_month_loan_payment
     lp= self.loan_payments.last

      if !lp.nil? and (lp.created_at.month== Date.today.month and lp.created_at.year== Date.today.year)
        return lp
      else
        return nil
      end
    end

    def loan_remaining
       if  self.returned_amount.nil?
        return self.loan_amount
      elsif self.loan_amount>self.returned_amount
        return self.loan_amount-self.returned_amount
      else
        return nil
      end
    end


    protected

    def is_updateable?
      if  returned_amount.nil? or loan_amount>=returned_amount
        return true
      else
        return false
      end
    end

    

end
