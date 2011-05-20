class DonationsController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  # GET /donations
  # GET /donations.xml
  def index
    @donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.xml
  def show
    @donner= Donner.find(params[:id])
    @donation= Donation.new
    @donations = Donation.find_all_by_donner_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.xml
  def new
    @donation = Donation.new
    @donation.donner_id=params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.xml
  def create
    @donation = Donation.new(params[:donation])

    respond_to do |format|
      if @donation.save
        donner=Donner.find(@donation.donner_id)
        format.html { redirect_to(donner, :notice => 'Donation was successfully created.') }
      else
        flash[:error]="Invalid Details.."
        format.html { redirect_to :action => "new", :id=> @donation.donner_id}
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.xml
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        donner=Donner.find(@donation.donner_id)
        format.html { redirect_to(donner, :notice => 'Donation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.xml
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    donner=Donner.find(@donation.donner_id)
    respond_to do |format|
      format.html { redirect_to(donner, :notice => 'Donation deleted.') }
      format.xml  { head :ok }
    end
  end
end
