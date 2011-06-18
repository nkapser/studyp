class Course < ActiveRecord::Base
  has_and_belongs_to_many :colleges, :join_table => "colleges_courses"
  
  def get_qualified_courses(college_id, score)
    find(:all, :conditions => ["college_id in (?) and (min_score >= ? and max_score <= ?)", college_id, score, score])
  end
  
  def scores(year_id = 2011, college_id)
    Course.find_by_sql(["SELECT courses.name as name, cutoff_scores.min_score, cutoff_scores.max_score FROM courses INNER JOIN cutoff_scores ON cutoff_scores.course_id = courses.id WHERE exam_year_id=? and college_id=? and course_id=?", year_id, college_id, self.id])
  end
  
  def get_courses(college_id, min_score, max_score)
    find(:all, :conditions => ["college_id = ? and (min_score >= ? and max_score <= ?)", college_id, min_score, max_score])
  end
  
end
