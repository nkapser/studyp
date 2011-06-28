# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'csv'
require 'mysql'    
Studyp::Application.load_tasks

namespace :create do
  task :exams => :environment do
    ['BITSAT', 'IIT-JEE', 'EAMCET', 'AIEEE'].each do |exam_name|  
      Exam.create!(:name => exam_name)
    end      
  end
  
  task :colleges => [:exams] do
    exam = Exam.find_by_name("BITSAT")
    ["Bits-Pilani", "Bits-Goa", "Bits-Hyderabad"].each do |college_name|
      College.create!(:name => college_name, :exam => exam)
    end
  end
end

namespace :data do
  
  task :bits => :environment do
    year=ExamYear.find_or_create_by_year("2009")
    CSV.foreach("#{Rails.root}/db/data/bits-2009.txt", {:headers => true,  :col_sep => ","}) do |f|      
      @college=College.find_or_create_by_name(f["college"])
      @course=Course.find_or_create_by_name(f["course"])      
      
      @college.courses << @course
      
      CutoffScore.create!({:min_score => f["score"], :max_score => 0, :exam_year => year, :colleges_courses_id => CollegesCourse.find(:first, :conditions => ["college_id =? and course_id=?", @college, @course])})
    end
  end  
  
  task :eamcet_courses => :environment do
    File.open("#{Rails.root}/db/data/courses-2009.csv").each_line do |line|
      data=line.split("|")
      course=Course.find_or_create_by_name(data.last.strip!)
      course.course_code=data.first
      course.save!
    end
  end
  
  task :eamcet_colleges => :environment do
    exam = Exam.find_by_name("EAMCET")
    CSV.foreach("#{Rails.root}/db/data/eamcet-colleges.txt", {:headers => true,  :col_sep => "|"}) do |f|
      College.create!({:name => f["NAME"], :exam => exam, :code => f["CODE"], :estd => f["ESTD"], :affl => f["AFFL"], :coed => f["COED"], :min => f["MIN"], :type => f["TYPE"], :reg => f["REG"], :dist => f["DIST"], :place => f["PLACE"]})
    end
  end
  
  task :eamcet_cutoff_2009 => :environment do
    exam_year=ExamYear.find_or_create_by_year("2009")

      CSV.foreach("#{Rails.root}/db/data/eamcet-cutoffs-2009.csv", {:headers => true}) do |f|
        @college = College.find_by_code(f["CODE"])
        @course = Course.find_by_course_code(f["CRS"])
        
        @college.courses << @course unless @college.courses.include?(@course)
        
       CutoffScore.create!({
          :exam_year => exam_year, 
          :colleges_course => CollegesCourse.find_by_college_id_and_course_id(@college.id, @course.id),
          :oc_boy => f["OC-BOY"],
          :oc_girl => f["OC-GIRL"],
          :sc_boy => f["SC-BOY"],
          :sc_girl => f["SC-GIRL"],
          :st_boy => f["ST-BOY"],
          :st_girl => f["ST-GIRL"],
          :bca_boy => f["BCA-BOY"], 
          :bca_girl => f["BCA-GIRL"], 
          :bcb_boy => f["BCB-BOY"], 
          :bcb_girl => f["BCB-GIRL"], 
          :bcc_boy => f["BCC-BOY"], 
          :bcc_girl => f["BCC-GIRL"], 
          :bcd_boy => f["BCD-BOY"], 
          :bcd_girl => f["BCD-GIRL"], 
          :bce_boy => f["BCE-BOY"], 
          :bce_girl => f["BCE-GIRL"]
          })
      end
  end
  
  task :eamcet_cutoff_2010 => :environment do
    exam_year=ExamYear.find_or_create_by_year("2010")

      CSV.foreach("#{Rails.root}/db/data/eamcet-cutoffs-2010.csv", {:headers => true}) do |f|
        @college = College.find_by_code(f["CODE"])
        @college = College.create({:code => f["CODE"], :name => ""}) if @college.nil?
        @course = Course.find_by_course_code(f["CRS"])
        
        begin
        @college.courses << @course unless @college.courses.include?(@course)
        rescue Exception => e
          puts @college.inspect
          puts "#{@course.inspect} -- #{f['CRS']}"
          
          raise e
        end
        
       CutoffScore.create!({
          :exam_year => exam_year, 
          :colleges_course => CollegesCourse.find_by_college_id_and_course_id(@college.id, @course.id),
          :oc_boy => f["OC-BOY"],
          :oc_girl => f["OC-GIRL"],
          :sc_boy => f["SC-BOY"],
          :sc_girl => f["SC-GIRL"],
          :st_boy => f["ST-BOY"],
          :st_girl => f["ST-GIRL"],
          :bca_boy => f["BCA-BOY"], 
          :bca_girl => f["BCA-GIRL"], 
          :bcb_boy => f["BCB-BOY"], 
          :bcb_girl => f["BCB-GIRL"], 
          :bcc_boy => f["BCC-BOY"], 
          :bcc_girl => f["BCC-GIRL"], 
          :bcd_boy => f["BCD-BOY"], 
          :bcd_girl => f["BCD-GIRL"], 
          :bce_boy => f["BCE-BOY"], 
          :bce_girl => f["BCE-GIRL"]
          })
      end
  end
  
  
  
  task :update_college_address_seats => :environment do
      CSV.foreach("#{Rails.root}/db/data/college-address-seats.csv", {:headers => true,  :col_sep => "|"}) do |f|
        
        @college = College.find_by_code(f["CODE"])
        @college = College.create({:code => f["CODE"], :name => ""})          if @college.nil?
        
        @college.update_attributes!(
        {
        	:address => f["ADDRESS"], 
        	:period => f["PERIOD"],         	
        	:go_no => f["GONO"], 
        	:website_url => f["WEBSITE"], 
        	:total_seats => f["TOTAL"],
        	:aicte_approval => f["AICTEAPPROVAL"],         	
        }
        )
        
        @college.colleges_courses.each do |college_course|
          college_course.seats = f["CSE"] if college_course.course.course_code == "CSE"
          college_course.seats = f["EEE"] if college_course.course.course_code == "EEE"
          college_course.seats = f["ECE"] if college_course.course.course_code == "ECE"
          college_course.seats = f["INF"] if college_course.course.course_code == "INF"
          college_course.seats = f["MEC"] if college_course.course.course_code == "MEC"
          college_course.seats = f["CIV"] if college_course.course.course_code == "CIV"
          college_course.save!          
        end              
        
      end
  end
  

end
