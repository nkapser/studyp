class CreateCollegesCoursesTable < ActiveRecord::Migration
  def self.up
    create_table :colleges_courses, :id => false do |t|
      t.integer :college_id
      t.integer :course_id
    end
  end

  def self.down
    drop_table :colleges_courses
  end
end
