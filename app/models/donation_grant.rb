class DonationGrant < ActiveRecord::Base
belongs_to :applicant

validates_presence_of :amount, :applicant_id, :comment
validates_numericality_of :amount, :greater_than=>0

    def self.total_grant
      DonationGrant.sum(:amount)
    end

    

end
