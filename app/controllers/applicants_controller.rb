class ApplicantsController < ApplicationController
  # GET /applicants
  # GET /applicants.xml
before_filter :authorize_admin, :except => [:login]
  def index
#    @page_count= Applicant.all.count/20
#    if params[:page_number]
#      @applicants = Applicant.limit(20).offset(params[:page_number].to_i * 20)
#      @current_page=params[:page_number]
#    else
#      @applicants = Applicant.limit(20)
#      @current_page=1
#    end


    if params[:page]
      @current_page=params[:page]
      @applicants = Applicant.list(params[:page])
    else
      @applicants = Applicant.list(1)
      @current_page=1
    end



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @applicants }
    end
  end


  # GET /applicants/1
  # GET /applicants/1.xml
  def show
    @applicant = Applicant.find(params[:id])
    @guarantors= Guarantor.find_all_by_applicant_id(params[:id])
    @children=Child.find_all_by_applicant_id(params[:id])
    @expenditures=Expenditure.find_all_by_applicant_id(params[:id])
    #@loan_transactions=LoanTransaction.find_all_by_applicant_id(params[:id])
    @loan_grants=LoanGrant.find_all_by_applicant_id(params[:id])
    @incomes=Income.find_all_by_applicant_id(params[:id])
    @payment_plans=PaymentPlan.find_all_by_applicant_id(params[:id])
    @donation_grants=DonationGrant.find_all_by_applicant_id(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @applicant }
    end
  end

  # GET /applicants/new
  # GET /applicants/new.xml
  def new
    @applicant = Applicant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @applicant }
    end
  end

  # GET /applicants/1/edit
  def edit
    @applicant = Applicant.find(params[:id])
  end

  # POST /applicants
  # POST /applicants.xml
  def create
    @applicant = Applicant.new(params[:applicant])

    respond_to do |format|
      if @applicant.save
        format.html { redirect_to(@applicant, :notice => 'Applicant was successfully created.') }
        format.xml  { render :xml => @applicant, :status => :created, :location => @applicant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @applicant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /applicants/1
  # PUT /applicants/1.xml
  def update
    @applicant = Applicant.find(params[:id])

    respond_to do |format|
      if @applicant.update_attributes(params[:applicant])
        format.html { redirect_to(@applicant, :notice => 'Applicant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @applicant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /applicants/1
  # DELETE /applicants/1.xml
  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy

    respond_to do |format|
      format.html { redirect_to(applicants_url) }
      format.xml  { head :ok }
    end
  end
end
