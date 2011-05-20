class CreatePaymentPlans < ActiveRecord::Migration
  def self.up
    create_table :payment_plans do |t|
      t.string :detail
      t.integer :applicant_id
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_plans
  end
end
