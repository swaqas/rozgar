class InitData < ActiveRecord::Migration
  def self.up
        AdminUser.create(:login=>'admin', :password=>"0192023a7bbd73250516f069df18b500", :super=>1)
        Country.create( :name => 'Pakistan' )
        City.create( :name => 'Karachi' )
  end

  def self.down
    
  end
end
