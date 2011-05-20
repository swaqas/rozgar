class GuarantorsController < ApplicationController
  # GET /guarantors
  # GET /guarantors.xml
before_filter :authorize_admin, :except => [:login]
  def index
    @guarantors = Guarantor.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @guarantors }
    end
  end

  # GET /guarantors/1
  # GET /guarantors/1.xml
  def show
    @guarantor = Guarantor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @guarantor }
    end
  end

  # GET /guarantors/new
  # GET /guarantors/new.xml
  def new
    @guarantor = Guarantor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @guarantor }
    end
  end

  # GET /guarantors/1/edit
  def edit
    @guarantor = Guarantor.find(params[:id])
  end

  # POST /guarantors
  # POST /guarantors.xml
  def create
    @guarantor = Guarantor.new(params[:guarantor])

    respond_to do |format|
      if @guarantor.save
        applicant=Applicant.find(@guarantor.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Guarantor was successfully updated.') }
        format.xml  { render :xml => @guarantor, :status => :created, :location => @guarantor }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @guarantor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guarantors/1
  # PUT /guarantors/1.xml
  def update
    @guarantor = Guarantor.find(params[:id])

    respond_to do |format|
      if @guarantor.update_attributes(params[:guarantor])
        applicant=Applicant.find(@guarantor.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Guarantor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @guarantor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guarantors/1
  # DELETE /guarantors/1.xml
  def destroy
    @guarantor = Guarantor.find(params[:id])
    @guarantor.destroy
    applicant=Applicant.find(@guarantor.applicant_id)
    respond_to do |format|
      format.html { redirect_to(applicant, :notice => 'Guarantor deleted.') }
      format.xml  { head :ok }
    end
  end
end
