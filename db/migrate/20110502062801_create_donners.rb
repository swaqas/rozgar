class CreateDonners < ActiveRecord::Migration
  def self.up
    create_table :donners do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :street
      t.integer :city_id
      t.integer :country_id
      t.string :phone
      t.string :mobile
      t.string :about

      t.timestamps
    end
  end

  def self.down
    drop_table :donners
  end
end
