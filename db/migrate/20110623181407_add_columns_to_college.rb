class AddColumnsToCollege < ActiveRecord::Migration
  def self.up
    add_column :colleges, :address, :string
    add_column :colleges, :period, :string
    add_column :colleges, :go_no, :string    
    add_column :colleges, :website_url, :string
    add_column :colleges, :total_seats, :integer
    add_column :colleges, :aicte_approval, :string        
  end

  def self.down
    remove_column :colleges, :address
    remove_column :colleges, :period
    remove_column :colleges, :go_no    
    remove_column :colleges, :website_url
    remove_column :colleges, :total_seats
    remove_column :colleges, :aicte_approval
  end
end