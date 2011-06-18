class AddAdditionalColumnsToColleges < ActiveRecord::Migration
  def self.up
    add_column :colleges, :code, :integer    
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
    drop_column :colleges, :code    
    drop_column :colleges, :estd
    drop_column :colleges, :affl
    drop_column :colleges, :coed
    drop_column :colleges, :min 
    drop_column :colleges, :type   
    drop_column :colleges, :reg   
    drop_column :colleges, :dist
    drop_column :colleges, :place
  end                           
end
