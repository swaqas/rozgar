class Guarantor < ActiveRecord::Base
belongs_to :applicant
belongs_to :country
belongs_to  :city

validates_presence_of :id_card_number, :first_name, :last_name, :address, :city_id, :country_id, :applicant_id
validates_length_of :first_name, :last_name, :within => 3..100
validates_length_of :phone, :mobile, :within => 8..100
validates_length_of :id_card_number, :within => 13..16

end
