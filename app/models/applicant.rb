class Applicant < ActiveRecord::Base
  belongs_to :country
  belongs_to  :city
  has_many :children, :dependent => :destroy
  has_many :expenditures, :dependent => :destroy
  has_many  :guarantors, :dependent => :destroy
  has_many :incomes, :dependent => :destroy
  has_many :payment_plans, :dependent => :destroy
  has_many :loan_grants, :dependent => :destroy
  has_many :donner_applicants
  has_many :donners, :through => :donner_applicants, :dependent => :destroy

  has_attached_file :photo, :styles => {:small=>"150x150>"},
    :url=>"/assets/applicants/:id/:style/:basename.:extension",
    :path=>":rails_root/public/assets/applicants/:id/:style/:basename.:extension"

  validates_presence_of :first_name, :serial ,:id_card_number, :first_name, :last_name, :address, :city_id, :country_id
  validates_uniqueness_of :serial, :id_card_number, :mobile, :if=>"id.nil?"
  validates_length_of :phone, :mobile, :within => 8..100
  validates_length_of :id_card_number, :within => 13..16

  validates_numericality_of :city_id, :country_id, :only_integer => true

    has_attached_file :avatar, :styles => {
    :thumb => '50x'
  }
  
    def full_name
      first_name+" "+ last_name
    end

    def self.list(p)
      paginate :per_page=>20, :page=>p
    end

end
