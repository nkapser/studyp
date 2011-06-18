class AddCourseCodeCoursesTable < ActiveRecord::Migration
  def self.up
    add_column :courses, :course_code, :string
  end

  def self.down
    drop_column :courses, :course_code
  end
end
