class DonorMailer < ActionMailer::Base

layout 'donor_email'


  def applicant_linking donner_id
    
    @donner=Donner.find(donner_id);
    @from=ApplicationController::ADMINEMAIL
    #mail(:to=>ApplicationController::ADMINEMAIL, :subject=>"Assalaam o Alaikum #{@donner.full_name}, your Rozgar donation dispersal update")
    @content_type ="text/html"
    @recipients="swm@veriqual.com"
   @subject="Assalaam o Alaikum "
  end


end
