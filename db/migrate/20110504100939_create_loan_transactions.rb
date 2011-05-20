class CreateLoanTransactions < ActiveRecord::Migration
  def self.up
    create_table :loan_transactions do |t|
      t.integer :donner_id
      t.integer :applicant_id
      t.decimal :debit
      t.decimal :credit
      t.string :comment
      t.integer :transaction_type_id
      t.timestamps
    end
  end

  def self.down
    drop_table :loan_transactions
  end
end
