class LoanGrant < ActiveRecord::Base
belongs_to :applicant


    def self.total_grant
      grant=LoanGrant.sum(:loan_amount)
    end
end
