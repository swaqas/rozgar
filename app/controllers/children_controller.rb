class ChildrenController < ApplicationController
before_filter :authorize_admin, :except => [:login]
  def index
  @child=Child.new
  @child.applicant_id=params[:id]
  @children=Child.find_all_by_applicant_id(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @children }
    end
end

def show
  @applicant = Applicant.find(params[:id])
  redirect_to :action => "index",:id=>params[:id]
end

def destroy
    @child=Child.find(params[:id])
    @child.destroy
    redirect_to :action => "index",:id=>@child.applicant_id
  end


def create
    @child = Child.new(params[:child])

    respond_to do |format|
      if @child.save
        format.html { redirect_to(:action => "index",:id=>@child.applicant_id) }
        format.xml  { render :xml => @child, :status => :created, :location => {:action => "index",:id=>@child.applicant_id}} 
      else
        flash[:error]="Invalid details"
        format.html { redirect_to(:action => "index",:id=>@child.applicant_id) }
        format.xml  { render :xml => @child.errors, :status => :unprocessable_entity }
      end
    end
  end
end
