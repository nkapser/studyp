class College < ActiveRecord::Base
  belongs_to :exam

  has_many :colleges_courses
  has_many :courses, :through => :colleges_courses

  cattr_reader :per_page
  @@per_page = 25

  scope :with_district, lambda {|r| where(:dist => r) }  
  scope :with_region, lambda {|r| where(:reg => r) }
  scope :name_like, lambda {|n| where("name like ?", "%#{n}%")}
  
  def self.get_all_eamcet_colleges(page)
    @eamcet_exam||=Exam.find_by_name("EAMCET")
    self.paginate :page => page, :conditions => ["exam_id = ?", @eamcet_exam]
  end
end