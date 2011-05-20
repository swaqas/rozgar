class CreateDonations < ActiveRecord::Migration
  def self.up
    create_table :donations do |t|
      t.integer :donner_id
      t.decimal :amount
      t.date :received_at
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :donations
  end
end
