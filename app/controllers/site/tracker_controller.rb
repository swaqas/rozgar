class Site::TrackerController < ApplicationController
layout "site"
require 'gchart'
require 'googlecharts'

  
  def index

    if !params[:code].nil?
      @donner=Donner.find_by_random_code(params[:code])
    elsif !session[:code].nil?
        @donner=Donner.find_by_random_code(session[:code])
    end

      if !@donner.nil?
        session[:code]=@donner.random_code 
        @donations=Donation.find_all_by_donner_id(@donner.id)
        @donner_applicants=DonnerApplicant.find_all_by_donner_id(@donner.id)
        flash[:error]=""
      else
        flash[:error]="Invalid Access code.." 
      end
    
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @donner }
      end

    end


  def loan_dispersal
    don=Donner.all

    @donners=Array.new
    @donations=Array.new
    @total_donation=Donation.sum("amount")
    i=0
    don.each do |d|
     
      if !d.donations.sum("amount").nil? and d.donations.sum("amount") !=0
        @donations[i]=d.donations.sum("amount")
         @donners[i]=d.first_name + " " + d.last_name + " (Rs:#{@donations[i]})"
      else
        @donations[i]=0
         @donners[i]=d.first_name + " " + d.last_name + " (0)"

      end
      i=i+1

    end

  end




end
