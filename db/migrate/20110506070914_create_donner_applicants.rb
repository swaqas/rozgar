class CreateDonnerApplicants < ActiveRecord::Migration
  def self.up
    create_table :donner_applicants do |t|
      t.integer :donner_id
      t.integer :applicant_id

      t.timestamps
    end
  end

  def self.down
    drop_table :donner_applicants
  end
end
