class LoanTransaction < ActiveRecord::Base
belongs_to :donner
belongs_to :applicant

end
