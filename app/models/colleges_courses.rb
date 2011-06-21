class CollegesCourses < ActiveRecord::Base
  belongs_to :course
  belongs_to :college
end