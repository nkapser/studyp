class CutoffScore < ActiveRecord::Base
  belongs_to :course
  belongs_to :college
  belongs_to :exam_year
  
  cattr_reader :per_page
  @@per_page = 25
  
  def id
    "#{college_id}-#{course_id}"
  end
end
