class AddColumnToGuarantor < ActiveRecord::Migration
  def self.up
    change_table :guarantors do |t|
      t.integer :applicant_id
    end
  end

  def self.down
    change_table :guarantors do |t|
      t.remove :applicant_id
    end
  end
end
