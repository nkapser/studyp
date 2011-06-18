class Exam < ActiveRecord::Base
  has_many :colleges
  has_many :exam_years  
end
