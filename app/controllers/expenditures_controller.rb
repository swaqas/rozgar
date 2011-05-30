class ExpendituresController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  def index
  @expenditure=Expenditure.new
  @expenditure.applicant_id=params[:id]
  @expenditures=Expenditure.find_all_by_applicant_id(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expenditures }
    end
end

def show
  redirect_to :action => "index",:id=>params[:id]
end

def destroy
    @expenditure=Expenditure.find(params[:id])
    @expenditure.destroy
    redirect_to :action => "index",:id=>@expenditure.applicant_id
  end


def create
    @expenditure = Expenditure.new(params[:expenditure])

    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to(:action => "index",:id=>@expenditure.applicant_id) }
        format.xml  { render :xml => @expenditure, :status => :created, :location => {:action => "index",:id=>@expenditure.applicant_id}} 
      else

        flash[:error]="Invalid details.."
        format.html { redirect_to(:action => "index",:id=>@expenditure.applicant_id)}
        format.xml  { render :xml => @expenditure.errors, :status => :unprocessable_entity }
      end
    end
  end
end
