class CreateApplicants < ActiveRecord::Migration
  def self.up
    create_table :applicants do |t|
      t.string :serial
      t.date :entry_date
      t.string :first_name
      t.string :last_name
      t.string :father_first_name
      t.string :father_last_name
      t.string :id_card_number
      t.string :address
      t.string :street
      t.integer :city_id
      t.integer :country_id
      t.string :phone
      t.string :mobile
      t.string :education
      t.string :experience
      t.string :occupation
      t.string :about
      t.string :family
      t.integer :children
      t.string :prior_dues

      t.timestamps
    end
  end

  def self.down
    drop_table :applicants
  end
end
