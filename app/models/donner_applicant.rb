class DonnerApplicant < ActiveRecord::Base
belongs_to :donner
belongs_to :applicant
validates_presence_of :donner_id, :applicant_id
validates_uniqueness_of  :applicant_id, :scope=>:donner_id, :message=>"Duplicate Applicant.."
end
