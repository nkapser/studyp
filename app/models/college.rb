class College < ActiveRecord::Base
  belongs_to :exam

  has_many :colleges_courses
  has_many :courses, :through => :colleges_courses

  cattr_reader :per_page
  @@per_page = 25

  scope :with_district, lambda {|r| where(:dist => r) }  
  scope :with_region, lambda {|r| where(:reg => r) }
  scope :name_like, lambda {|n| where("name like ?", "%#{n}%")}
  scope :affiliated_to, lambda {|r| where(:affl => r) }
  
  def self.get_all_eamcet_colleges(page)
    @eamcet_exam||=Exam.find_by_name("EAMCET")
    self.paginate :page => page, :conditions => ["exam_id = ?", @eamcet_exam]
  end
  
  def get_cutoff_scores_for_courses
    colleges_courses.collect { |c|  
      { 
        :data => 
        c.cutoff_scores.collect { |cs| 
          { 
            :name => c.course.name, 
            :seats => c.seats,
            :year => cs.exam_year.year, 
            :oc_boy => cs.oc_boy, :oc_girl => cs.oc_girl, 
            :sc_boy => cs.sc_boy, :sc_girl => cs.sc_girl, 
            :st_boy => cs.st_boy, :st_girl => cs.st_girl, 
            :bca_boy => cs.bca_boy, :bca_girl => cs.bca_girl,
            :bcb_boy => cs.bcb_boy, :bcb_girl => cs.bcb_girl,
            :bcc_boy => cs.bcc_boy, :bcc_girl => cs.bcc_girl,
            :bcd_boy => cs.bcd_boy, :bcd_girl => cs.bcd_girl,
            :bce_boy => cs.bce_boy, :bce_girl => cs.bce_girl,                                                                                                
          }
        }
      }
    }
  end
end