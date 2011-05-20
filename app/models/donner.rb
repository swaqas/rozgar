class Donner < ActiveRecord::Base
  has_many :donner_applicants
  has_many :applicants, :through=>:donner_applicants, :dependent => :destroy
  has_many :donations, :dependent => :destroy
  
  before_create :valuate_code

  validates_presence_of :first_name, :last_name, :address, :city_id, :country_id
  validates_uniqueness_of :email, :mobile
  validates_length_of :email, :mobile, :within => 8..100


def self.get_random_code
    random_alphanumeric
end

  def full_name
    first_name+" "+ last_name
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
