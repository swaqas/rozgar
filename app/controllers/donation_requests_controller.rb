class DonationRequestsController < ApplicationController
  # GET /donation_requests
  # GET /donation_requests.xml
  def index
    @donation_requests = DonationRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donation_requests }
    end
  end

  # GET /donation_requests/1
  # GET /donation_requests/1.xml
  def show
    @donation_request = DonationRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donation_request }
    end
  end

  # GET /donation_requests/new
  # GET /donation_requests/new.xml
  def new
    @donation_request = DonationRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donation_request }
    end
  end

  # GET /donation_requests/1/edit
  def edit
    @donation_request = DonationRequest.find(params[:id])
  end

  # POST /donation_requests
  # POST /donation_requests.xml
  def create
    @donation_request = DonationRequest.new(params[:donation_request])

    respond_to do |format|
      if @donation_request.save
        format.html { redirect_to(@donation_request, :notice => 'Donation request was successfully created.') }
        format.xml  { render :xml => @donation_request, :status => :created, :location => @donation_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donation_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donation_requests/1
  # PUT /donation_requests/1.xml
  def update
    @donation_request = DonationRequest.find(params[:id])

    respond_to do |format|
      if @donation_request.update_attributes(params[:donation_request])
        format.html { redirect_to(@donation_request, :notice => 'Donation request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_requests/1
  # DELETE /donation_requests/1.xml
  def destroy
    @donation_request = DonationRequest.find(params[:id])
    @donation_request.destroy

    respond_to do |format|
      format.html { redirect_to(donation_requests_url) }
      format.xml  { head :ok }
    end
  end

  def transfer_to_donner
    donation_request = DonationRequest.find(params[:id])
    donner=Donner.create_donner(donation_request)
    
    if !donner.nil?
      donation_request.destroy
      redirect_to donner
    else
      redirect_to donation_request
    end
    
  end
end
