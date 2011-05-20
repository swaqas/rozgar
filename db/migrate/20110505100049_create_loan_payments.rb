class CreateLoanPayments < ActiveRecord::Migration
  def self.up
    create_table :loan_payments do |t|
      t.integer :applicant_id
      t.integer :loan_grant_id
      t.decimal :amount
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :loan_payments
  end
end
