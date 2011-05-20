class TrackerController < ApplicationController
  def index
    if !params[:code].nil? and !params[:code].blank
      @donner=Donner.find_by_random_code(params[:code])
      if !@donner.nil?
        @donations=Donation.find_all_by_donner_id(@donner.id)
        @donner_applicants=DonnerApplicant.find_all_by_donner_id(@donner.id)
      else
        flash[:error]="Invalid Access code--"
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donner }
    end



  end

end
