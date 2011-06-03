class DonorMailer < ActionMailer::Base

layout 'donor_email'


  def applicant_linking donner_id
    @donner=Donner.find(donner_id);
    @from=ApplicationController::ADMINEMAIL
    #mail(:to=>ApplicationController::ADMINEMAIL, :subject=>"Assalaam o Alaikum #{@donner.full_name}, your Rozgar donation dispersal update")
    @content_type ="text/html"
    @recipients=@donner.email
    @subject="Assalaam o Alaikum "
  end

   def applicant_defaulter donation_grant_id
    @donation_grant=DonationGrant.find(donation_grant_id)
    @applicant=Applicant.find(@donation_grant.applicant_id)
    
      @applicant.donners.each do |d|
        @donner=d
        @from=ApplicationController::ADMINEMAIL
        @content_type ="text/html"
        @recipients=d.email
        @subject="Assalaam o Alaikum "
      end
    
  end

end
