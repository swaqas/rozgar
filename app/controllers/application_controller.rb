class ApplicationController < ActionController::Base
  protect_from_forgery

  LOCAL_SETTINGS = YAML.load_file("#{Rails.root.to_s}/config/local_settings.yml")
   SITE_URL = LOCAL_SETTINGS["site"]
   ADMINEMAIL = LOCAL_SETTINGS["admin_email"]
   

  def authorize_admin
   session[:admin_id].blank? ? (redirect_to :controller => "admin_users", :action => "login" and return false) : (return true)
  end

end
