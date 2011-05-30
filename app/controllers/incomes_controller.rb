class IncomesController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  def index
  @income=Income.new
  @income.applicant_id=params[:id]
  @incomes=Income.find_all_by_applicant_id(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incomes }
    end
end

def show
  redirect_to :action => "index",:id=>params[:id]
end

def destroy
    @income=Income.find(params[:id])
    @income.destroy
    redirect_to :action => "index",:id=>@income.applicant_id
  end


def create
    @income = Income.new(params[:income])

    respond_to do |format|
      if @income.save
        format.html { redirect_to(:action => "index",:id=>@income.applicant_id) }
        format.xml  { render :xml => @income, :status => :created, :location => {:action => "index",:id=>@income.applicant_id}}
      else
        flash[:error]="Invalid details.."
        format.html { redirect_to(:action => "index",:id=>@income.applicant_id)}
        format.xml  { render :xml => @income.errors, :status => :unprocessable_entity }
      end
    end
  end
end
