class AddAdditionalColumnsToColleges < ActiveRecord::Migration
  def self.up
    add_column :colleges, :code, :string    
    add_column :colleges, :estd, :integer
    add_column :colleges, :affl, :string
    add_column :colleges, :coed, :string
    add_column :colleges, :min, :string
    add_column :colleges, :type, :string    
    add_column :colleges, :reg, :string    
    add_column :colleges, :dist, :string    
    add_column :colleges, :place, :string        
  end

  def self.down
    remove_column :colleges, :code    
    remove_column :colleges, :estd
    remove_column :colleges, :affl
    remove_column :colleges, :coed
    remove_column :colleges, :min 
    remove_column :colleges, :type   
    remove_column :colleges, :reg   
    remove_column :colleges, :dist
    remove_column :colleges, :place
  end                           
end
