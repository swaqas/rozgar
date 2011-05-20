class CreateLoanGrants < ActiveRecord::Migration
  def self.up
    create_table :loan_grants do |t|
      t.integer :applicant_id
      t.decimal :loan_amount
      t.decimal :returned_amount
      t.decimal :instalment_amount
      t.string :comment
      t.integer :grant_status_id
      t.timestamps
    end
  end

  def self.down
    drop_table :loan_grants
  end
end
