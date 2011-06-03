class Site::ApplicantsController < ApplicationController
layout "site"
  def index
    @applicant = Applicant.find(params[:id])
    @guarantors= Guarantor.find_all_by_applicant_id(params[:id])
    @children=Child.find_all_by_applicant_id(params[:id])
    @expenditures=Expenditure.find_all_by_applicant_id(params[:id])
    @loan_grants=LoanGrant.find_all_by_applicant_id(params[:id])
    @incomes=Income.find_all_by_applicant_id(params[:id])
    @payment_plans=PaymentPlan.find_all_by_applicant_id(params[:id])
    @donation_grants=DonationGrant.find_all_by_applicant_id(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @applicant }
    end
  end

end
