class CreateExpenditures < ActiveRecord::Migration
  def self.up
    create_table :expenditures do |t|
      t.string :detail
      t.integer :applicant_id
      t.timestamps
    end
  end

  def self.down
    drop_table :expenditures
  end
end
