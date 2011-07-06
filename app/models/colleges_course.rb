class CollegesCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :college
  
  has_many :cutoff_scores, :foreign_key => 'colleges_courses_id'
end