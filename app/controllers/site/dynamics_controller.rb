class Site::DynamicsController < ApplicationController
  layout "site"
  def contribute
    @donation_request = DonationRequest.new
  end

  def contribute_save
    @donation_request = DonationRequest.new(params[:donation_request])

      if @donation_request.save
          redirect_to :action=>"content", :message=>"Thanks for your intrests, your information has been recorded, we will contact you very soon."
      else
        render :action => "contribute"
      end
    
  end

  def content 
          
  end


end
