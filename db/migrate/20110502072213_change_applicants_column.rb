class ChangeApplicantsColumn < ActiveRecord::Migration
  def self.up
    change_table :applicants do |t|
      t.rename :children, :number_of_children
    end
  end

  def self.down
    change_table :applicants do |t|
      t.rename :number_of_children, :children
    end
  end
end
