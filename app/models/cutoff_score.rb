class CutoffScore < ActiveRecord::Base
  belongs_to :course
  belongs_to :college
  belongs_to :exam_year
end
