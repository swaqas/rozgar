class LoanGrantsController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  # GET /loan_grants
  # GET /loan_grants.xml
#  def index
#    @loan_grants = LoanGrant.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.xml  { render :xml => @loan_grants }
#    end
#  end

  # GET /loan_grants/1
  # GET /loan_grants/1.xml
#  def show
#    @loan_grant = LoanGrant.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @loan_grant }
#    end
#  end
#
  # GET /loan_grants/new
  # GET /loan_grants/new.xml
  def new
    @loan_grant = LoanGrant.new
    @loan_grant.applicant_id=params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loan_grant }
    end
  end

  # GET /loan_grants/1/edit
  def edit
    @loan_grant = LoanGrant.find(params[:id])
  end

  # POST /loan_grants
  # POST /loan_grants.xml
  def create
    @loan_grant = LoanGrant.new(params[:loan_grant])

    respond_to do |format|
      if @loan_grant.save
        applicant=Applicant.find(@loan_grant.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Loan grant was successfully created.') }
        format.xml  { render :xml => @loan_grant, :status => :created, :location => @loan_grant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loan_grant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loan_grants/1
  # PUT /loan_grants/1.xml
  def update
    @loan_grant = LoanGrant.find(params[:id])

    respond_to do |format|
      if @loan_grant.update_attributes(params[:loan_grant])
        applicant=Applicant.find(@loan_grant.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Loan grant was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loan_grant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_grants/1
  # DELETE /loan_grants/1.xml
  def destroy
    @loan_grant = LoanGrant.find(params[:id])
    applicant=Applicant.find(@loan_grant.applicant_id)
    @loan_grant.destroy

    respond_to do |format|
       format.html { redirect_to(applicant, :notice => 'Loan Grant deleted.') }
       format.xml  { head :ok }
    end
  end
end
