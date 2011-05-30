class LoanPaymentsController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  # GET /loan_payments
  # GET /loan_payments.xml
##  def index
##    @loan_payments = LoanPayment.all
##
##    respond_to do |format|
##      format.html # index.html.erb
##      format.xml  { render :xml => @loan_payments }
##    end
##  end
##
##  # GET /loan_payments/1
##  # GET /loan_payments/1.xml
##  def show
##    @loan_payment = LoanPayment.find(params[:id])
##
##    respond_to do |format|
##      format.html # show.html.erb
##      format.xml  { render :xml => @loan_payment }
##    end
##  end

  # GET /loan_payments/new
  # GET /loan_payments/new.xml
  def new

    loan_grant = LoanGrant.find(params[:id])

    @loan_payment = LoanPayment.new
    @loan_payment.loan_grant_id=params[:id]
    @loan_payment.applicant_id=loan_grant.applicant_id
    @loan_payment.amount=loan_grant.instalment_amount
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loan_payment }
    end
  end

  # GET /loan_payments/1/edit
  def edit
    @loan_payment = LoanPayment.find(params[:id])
  end

  # POST /loan_payments
  # POST /loan_payments.xml
  def create
    @loan_payment = LoanPayment.new(params[:loan_payment])
    loan_grant = LoanGrant.find(params[:loan_payment][:loan_grant_id])
    @loan_payment.applicant_id=loan_grant.applicant_id

    respond_to do |format|
      if @loan_payment.save
        applicant=Applicant.find(@loan_payment.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Loan payment was successfully created.') }
        format.xml  { render :xml => @loan_payment, :status => :created, :location => @loan_payment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loan_payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loan_payments/1
  # PUT /loan_payments/1.xml
  def update
    @loan_payment = LoanPayment.find(params[:id])

    respond_to do |format|
      if @loan_payment.update_attributes(params[:loan_payment])
        applicant=Applicant.find(@loan_payment.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Loan payment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loan_payment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_payments/1
  # DELETE /loan_payments/1.xml
  def destroy
    @loan_payment = LoanPayment.find(params[:id])
    applicant=Applicant.find(@loan_payment.applicant_id)
    @loan_payment.destroy

    respond_to do |format|
      format.html { redirect_to(applicant) }
      format.xml  { head :ok }
    end
  end



end
