class AddColumnsToCollegesCourse < ActiveRecord::Migration
  def self.up
    add_column :colleges_courses, :seats, :integer
  end

  def self.down
    remove_column :colleges_courses, :seats  
  end
end
