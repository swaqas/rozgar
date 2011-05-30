class DonnersController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  # GET /donners
  # GET /donners.xml
  def index
    #@donners = Donner.all

     if params[:page]
      @current_page=params[:page]
      @donners = Donner.list(params[:page])
    else
      @donners = Donner.list(1)
      @current_page=1
    end


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donners }
    end
  end

  # GET /donners/1
  # GET /donners/1.xml
  def show
    @donner = Donner.find(params[:id])
    @donations=Donation.find_all_by_donner_id(params[:id])
    @donner_applicant=DonnerApplicant.new
    @donner_applicants=DonnerApplicant.find_all_by_donner_id(params[:id])
    @donner_applicant.donner_id=params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donner }
    end
  end

  # GET /donners/new
  # GET /donners/new.xml
  def new
    @donner = Donner.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donner }
    end
  end

  # GET /donners/1/edit
  def edit
    @donner = Donner.find(params[:id])
  end

  # POST /donners
  # POST /donners.xml
  def create
    @donner = Donner.new(params[:donner])

    respond_to do |format|
      if @donner.save
        format.html { redirect_to(@donner, :notice => 'Donner was successfully created.') }
        format.xml  { render :xml => @donner, :status => :created, :location => @donner }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donners/1
  # PUT /donners/1.xml
  def update
    @donner = Donner.find(params[:id])

    respond_to do |format|
      if @donner.update_attributes(params[:donner])
        format.html { redirect_to(@donner, :notice => 'Donner was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donners/1
  # DELETE /donners/1.xml
  def destroy
    @donner = Donner.find(params[:id])
    @donner.destroy

    respond_to do |format|
      format.html { redirect_to(donners_url) }
      format.xml  { head :ok }
    end
  end

#########################  Applicant Donner  ##################################################



def create_applicant
    @donner_applicant = DonnerApplicant.new(params[:donner_applicant])
    
    respond_to do |format|
      if @donner_applicant.save

      #DonorMailer.applicant_linking(@donner_applicant.donner_id).deliver

      donner=Donner.find(@donner_applicant.donner_id)
        format.html { redirect_to(donner, :notice => 'Applicant successfully Added.') }
      else
        @donner=Donner.find(@donner_applicant.donner_id)
        @donations=Donation.find_all_by_donner_id(@donner_applicant.donner_id)
        @donner_applicants=DonnerApplicant.find_all_by_donner_id(@donner_applicant.donner_id)

        format.html { render :action => "show" }
        format.xml  { render :xml => @donner.errors, :status => :unprocessable_entity }
      end


    end
  end

  def destroy_applicant
    donner_applicant = DonnerApplicant.find_by_applicant_id_and_donner_id(params[:applicant_id],params[:donner_id])
    donner=Donner.find(donner_applicant.donner_id)
    donner_applicant.destroy

    respond_to do |format|
      format.html { redirect_to(donner, :notice => 'Applicant successfully Added.') }
      format.xml  { head :ok }
    end
  end

end





