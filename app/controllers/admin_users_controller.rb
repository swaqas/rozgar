class AdminUsersController < ApplicationController
  before_filter :authorize_admin, :except => [:login]
  before_filter :super_admin_authorization, :only => [:new, :update, :edit, :destroy, :create, :index]


def main
end


 def login
    if !session[:admin_id].nil?
      redirect_to :action => :index
      return
    end
    if request.post?
      session[:admin_id]=nil
      @admin_user=AdminUser.authenticate(params[:admin_user][:login].to_s, params[:admin_user][:password].to_s)

      if @admin_user.blank?
        flash[:error]  = "Login or password incorrect"
        render :action=>:login, :layout=>"login"
     else
        if @admin_user.super
          session[:admin_type]="super_admin"
        end
        session[:admin_id]=@admin_user.login
        session[:admin_user_id]=@admin_user.id
        flash[:notice]= "Hello #{session["login_id"].to_s} Welcome to admin panel"
        render :action=>:main
      end
    else
       render :action=>:login, :layout=>"login"
   end
  end


def logout
    session[:admin_id]=nil
    session[:admin_type]=nil
    flash[:error]  = "You have been Logged out of the system.."
    redirect_to :action=>:login, :layout=>"login"
end


  def index
    @admin_users = AdminUser.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_users }
    end
  end

  def new
    @admin_user = AdminUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_user }
    end
  end

  # GET /admin_users/1/edit
  def edit
    @admin_user = AdminUser.find(params[:id])
    @admin_user.password=""
  end

  # POST /admin_users
  # POST /admin_users.xml
  def create
    @admin_user = AdminUser.new(params[:admin_user])

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to(admin_users_url, :notice => 'Admin user was successfully created.')}
        
        format.xml  { render :xml => @admin_user, :status => :created, :location => @admin_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_users/1
  # PUT /admin_users/1.xml
  def update
    @admin_user = AdminUser.find(params[:id])

    respond_to do |format|
      if @admin_user.update_attributes(params[:admin_user])
        format.html { redirect_to(admin_users_url, :notice => 'Admin user was successfully updated.')}
        #format.html { redirect_to(@admin_user, :notice => 'Admin user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_users/1
  # DELETE /admin_users/1.xml
  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy

    respond_to do |format|
      format.html { redirect_to(admin_users_url) }
      format.xml  { head :ok }
    end
  end

private
def super_admin_authorization
       if session[:admin_type].nil? or session[:admin_type]!="super_admin"
        flash[:notice]= "You are not authorized to access this page.."
        render :action=>:main
       end
end

end
