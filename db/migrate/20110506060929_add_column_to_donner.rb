class AddColumnToDonner < ActiveRecord::Migration
  def self.up
    add_column :donners, :random_code, :string
  end

  def self.down
    remove_column :donners, random_code
  end
end
