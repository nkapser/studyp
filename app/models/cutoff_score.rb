class CutoffScore < ActiveRecord::Base
  belongs_to :exam_year
  belongs_to :colleges_course, :foreign_key => :colleges_courses_id
  
  cattr_reader :per_page
  @@per_page = 15

  scope :year, where(:exam_year_id => 2)
  scope :column, lambda {|col,rank| where("cutoff_scores.? >= ?", "#{col}", "#{rank}") }
  scope :affiliated_to, lambda {|affl| where("affl in (?)", affl)}
  scope :course, lambda {|c| where("course_code = ?", c)}
  scope :regions_in, lambda {|r| where("reg in (?)", r)}
  scope :without_empty_names, where("colleges.name != ''")
  
  def self.rank_for_year(data, page, year=2010)        
    col="#{data[:caste]}-#{data[:gender]}".underscore
    data[:affl] 
    affls=data[:affl] 
    course=data[:course]
    regions=data[:reg]
    
    @cutoff=CutoffScore.without_empty_names.year.column(col, data[:rank])
    
    unless affls.nil? || affls.empty?
      affls=affls.collect{|x| x if x!=""}.compact
      @cutoff=@cutoff.affiliated_to(affls) unless affls.empty?
    end
    
    unless course.nil? || course.empty?
      @cutoff=@cutoff.course(course)
    end
    
    unless regions.nil? || regions.empty?
      regions=regions.collect{|x| x if x!=""}.compact
      @cutoff=@cutoff.regions_in(regions) unless regions.empty?
    end    
    
    @cutoff.paginate :page => page, :order => "#{col} asc", :joins => [:colleges_course => [:college, :course]]
  end
  
end
