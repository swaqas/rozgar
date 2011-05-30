class PaymentPlansController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  def index
  @payment_plan=PaymentPlan.new
  @payment_plan.applicant_id=params[:id]
  @payment_plans=PaymentPlan.find_all_by_applicant_id(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_plans }
    end
end

def show
  redirect_to :action => "index",:id=>params[:id]
end

def destroy
    @payment_plan=PaymentPlan.find(params[:id])
    @payment_plan.destroy
    redirect_to :action => "index",:id=>@payment_plan.applicant_id
  end


def create
    @payment_plan = PaymentPlan.new(params[:payment_plan])

    respond_to do |format|
      if @payment_plan.save
        format.html { redirect_to(:action => "index",:id=>@payment_plan.applicant_id) }
        format.xml  { render :xml => @payment_plan, :status => :created, :location => {:action => "index",:id=>@payment_plan.applicant_id}}
      else
        flash[:error]="Invalid details.."
        format.html { redirect_to(:action => "index",:id=>@payment_plan.applicant_id)}
        format.xml  { render :xml => @payment_plan.errors, :status => :unprocessable_entity }
      end
    end
  end
end
