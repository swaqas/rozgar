class CreateLoanTransactionTypes < ActiveRecord::Migration
  def self.up
    create_table :loan_transaction_types do |t|
      t.string :transaction_type

      t.timestamps
    end
  end

  def self.down
    drop_table :loan_transaction_types
  end
end
