class CreateDonationGrants < ActiveRecord::Migration
  def self.up
    create_table :donation_grants do |t|
      t.integer :applicant_id
      t.decimal :amount
      t.string :comment
      t.date :grant_on

      t.timestamps
    end
  end

  def self.down
    drop_table :donation_grants
  end
end
