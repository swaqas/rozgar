class LoanTransactionsController < ApplicationController
  # GET /loan_transactions
  # GET /loan_transactions.xml
before_filter :authorize_admin, :except => [:login]

  def index
    @loan_transactions = LoanTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loan_transactions }
    end
  end

  # GET /loan_transactions/1
  # GET /loan_transactions/1.xml
  def show
    @loan_transaction = LoanTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @loan_transaction }
    end
  end

  # GET /loan_transactions/new
  # GET /loan_transactions/new.xml
  def new
    @loan_transaction = LoanTransaction.new
    @loan_transaction.applicant_id=params[:id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loan_transaction }
    end
  end

  # GET /loan_transactions/1/edit
  def edit
    @loan_transaction = LoanTransaction.find(params[:id])
  end

  # POST /loan_transactions
  # POST /loan_transactions.xml
  def create
    @loan_transaction = LoanTransaction.new(params[:loan_transaction])

    respond_to do |format|
      if @loan_transaction.save
        applicant=Applicant.find(@loan_transaction.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Loan transaction was successfully created.') }
        format.xml  { render :xml => @loan_transaction, :status => :created, :location => @loan_transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @loan_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loan_transactions/1
  # PUT /loan_transactions/1.xml
  def update
    @loan_transaction = LoanTransaction.find(params[:id])

    respond_to do |format|
      if @loan_transaction.update_attributes(params[:loan_transaction])
        applicant=Applicant.find(@loan_transaction.applicant_id)
        format.html { redirect_to(applicant, :notice => 'Loan transaction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @loan_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loan_transactions/1
  # DELETE /loan_transactions/1.xml
  def destroy
    @loan_transaction = LoanTransaction.find(params[:id])
    applicant=Applicant.find(@loan_transaction.applicant_id)
    @loan_transaction.destroy

    respond_to do |format|
    format.html { redirect_to(applicant, :notice => 'Loan transaction deleted.') }
    format.xml  { head :ok }
    end
  end
end
