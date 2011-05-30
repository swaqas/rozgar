# namespace :bootstrap do
#      desc "Add the default user"
#      task :default_user => :environment do
#        AdminUser.create(:name=>'admin', :password=>"0192023a7bbd73250516f069df18b500", :super=>1)
#      end
#
#      desc "Create the default comment"
#      task :default_date => :environment do
#        Country.create( :name => 'Pakistan' )
#        City.create( :name => 'Karachi' )
#      end
#
#    end
