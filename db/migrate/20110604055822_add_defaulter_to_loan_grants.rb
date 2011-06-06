class AddDefaulterToLoanGrants < ActiveRecord::Migration
  def self.up
    add_column :loan_grants, :defaulter, :boolean
  end

  def self.down
    remove_column :loan_grants, :defaulter
  end
end
