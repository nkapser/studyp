class CollegesCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :college
  
  has_many :cutoff_score
end