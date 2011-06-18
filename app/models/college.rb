class College < ActiveRecord::Base
  belongs_to :exam
  has_and_belongs_to_many :courses, :join_table => "colleges_courses"
  
  def self.get_courses(college_ids, score)
    College.find_by_sql(["SELECT colleges.*, cutoff_scores.* FROM colleges INNER JOIN cutoff_scores ON colleges.id=cutoff_scores.college_id WHERE cutoff_scores.college_id IN (?) AND (cutoff_scores.min_score >= ?)", college_ids, score])
  end  
end