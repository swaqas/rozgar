class DonationGrantsController < ApplicationController
  # GET /donation_grants
  # GET /donation_grants.xml
  before_filter :authorize_admin
#  def index
#    @donation_grants = DonationGrant.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @donation_grants }
#    end
#  end
#
#  # GET /donation_grants/1
#  # GET /donation_grants/1.xml
#  def show
#    redirect_to :action => "index",:id=>params[:id]
#  end

  # GET /donation_grants/new
  # GET /donation_grants/new.xml
  def new
    @donation_grant = DonationGrant.new
    @donation_grant.applicant_id = params[:applicant_id] if !params[:applicant_id].nil?
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donation_grant }
    end
  end

  # GET /donation_grants/1/edit
  def edit
    @donation_grant = DonationGrant.find(params[:id])
  end

  # POST /donation_grants
  # POST /donation_grants.xml
  def create
    @donation_grant = DonationGrant.new(params[:donation_grant])

    respond_to do |format|
      if @donation_grant.save
        applicant=Applicant.find(@donation_grant.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Donation grant was successfully created.') }
        format.xml  { render :xml => @donation_grant, :status => :created, :location => @donation_grant }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation_grant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donation_grants/1
  # PUT /donation_grants/1.xml
  def update
    @donation_grant = DonationGrant.find(params[:id])

    respond_to do |format|
      if @donation_grant.update_attributes(params[:donation_grant])
        applicant=Applicant.find(@donation_grant.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Donation grant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation_grant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_grants/1
  # DELETE /donation_grants/1.xml
  def destroy
    @donation_grant = DonationGrant.find(params[:id])
    @donation_grant.destroy
    applicant=Applicant.find(@donation_grant.applicant_id)
    respond_to do |format|
      format.html { redirect_to(applicant, :notice => 'Donation grant Deleted.') }
      format.xml  { head :ok }
    end
  end
end
