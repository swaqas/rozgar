class DonationRequest < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :address, :city_id, :country_id, :email, :mobile, :donation_amount
  validates_uniqueness_of :email, :mobile
  validates_length_of :email, :mobile, :within => 8..100
validates_length_of :first_name, :last_name, :address, :minimum => 3
  validates_numericality_of :donation_amount, :greater_than=>0
  
  def full_name
    first_name+" "+ last_name
  end
end
