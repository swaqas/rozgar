# Load the rails application
require File.expand_path('../application', __FILE__)

#Rails::Initializer.run do |config|
#  config.gem "googlecharts", :lib => "gchart"
#end


# Initialize the rails application

Rozgar::Application.initialize!

#
#config.action_mailer.delivery_method =  :smtp
#
#ActionMailer::Base.server_settings = {
#  :address => "smtp.gmail.com",
#  :port => 25,
#  :user_name => "swm@veriqual.com",
#  :password => "veritech",
#  :authentication => :plain }