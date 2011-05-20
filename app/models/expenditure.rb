class Expenditure < ActiveRecord::Base
belongs_to :applicant
validates_presence_of :detail

end
