# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'csv'
    
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
    File.open("#{Rails.root}/db/data/bits-2009.txt").each_line do |line|
      if line =~ /Bits-[\w]+:$/
        college_name=line.gsub(":","").strip!
        @college=College.find_or_create_by_name(college_name)
      end
      if line =~ /[^Bits].+/ && line != college_name
        data= line.split(":")    
        course_name=data[0].strip!    
        course = Course.find_or_create_by_name(course_name)
        @college.courses << course
        @college.save!
        CutoffScore.create!({:min_score => data[1].strip!, :max_score => 0, :exam_year => year, :course => course, :college => @college})
      end
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
       CutoffScore.create!({
          :exam_year => exam_year, 
          :college => @college, 
          :course => @course,
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
       CutoffScore.create!({
          :exam_year => exam_year, 
          :college => @college, 
          :course => @course,
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
  
end


