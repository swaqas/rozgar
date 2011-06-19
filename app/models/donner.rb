class Donner < ActiveRecord::Base
  has_many :donner_applicants
  has_many :applicants, :through=>:donner_applicants, :dependent => :destroy
  has_many :donations, :dependent => :destroy
  
  before_create :valuate_code

  validates_presence_of :first_name, :last_name, :address, :city_id, :country_id
  validates_uniqueness_of :email, :mobile
  validates_length_of :email, :mobile, :within => 8..100

  validates :email,
  :format     => { :with=>/^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/, :message => "Invalid Email Addess." }


  def self.get_random_code
    random_alphanumeric
  end

  def full_name
    first_name+" "+ last_name
  end

  def self.list(p)
    paginate :per_page=>20, :page=>p
  end

 def self.create_donner donation_request
   d=Donner.new
   d.first_name=donation_request.first_name
   d.last_name=donation_request.last_name
   d.email=donation_request.email
   d.address=donation_request.address
   d.street=donation_request.street
   d.city_id =donation_request.city_id
   d.country_id=donation_request.country_id
   d.phone=donation_request.phone
   d.mobile=donation_request.mobile
   d.about=donation_request.about
   d.save
   dd=Donation.new
   dd.amount=donation_request.donation_amount
   dd.donner_id=d.id
   dd.save
   d
 end


  private

  def valuate_code
    self.random_code=  random_alphanumeric
  end

  def random_alphanumeric()
    #(1..size).collect { (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }.join
    alphanumerics = [('0'..'9'),('A'..'Z')].map {|range| range.to_a}.flatten
    (0...6).map { alphanumerics[Kernel.rand(alphanumerics.size)] }.join

  end



end
