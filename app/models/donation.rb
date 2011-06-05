class Donation < ActiveRecord::Base
  belongs_to :donner
before_save :valuate_receive_date
  validates_numericality_of :amount, :greater_than=>0
  validates_presence_of :amount, :donner_id

    def self.total_fund
      Donation.sum(:amount)
    end
    private
    def valuate_receive_date
      self.received_at ||= Date.today
    end

end
