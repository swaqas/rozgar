class Donation < ActiveRecord::Base
  belongs_to :donner
  validates_numericality_of :amount, :greater_than=>0
  validates_presence_of :amount, :received_at, :donner_id

    def self.total_fund
      Donation.sum(:amount)
    end

end
