class CreateGuarantors < ActiveRecord::Migration
  def self.up
    create_table :guarantors do |t|
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
      t.string :relationship
      t.string :opinion

      t.timestamps
    end
  end

  def self.down
    drop_table :guarantors
  end
end
