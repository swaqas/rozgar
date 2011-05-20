class Donation < ActiveRecord::Base
  belongs_to :donner
  validates_numericality_of :amount
  validates_presence_of :amount, :received_at

    def self.total_fund
      fund=Donation.sum(:amount)
    end

end
