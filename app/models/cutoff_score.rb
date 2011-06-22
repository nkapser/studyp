class CutoffScore < ActiveRecord::Base
  belongs_to :exam_year
  belongs_to :colleges_course, :foreign_key => :colleges_courses_id
  
  cattr_reader :per_page
  @@per_page = 25
  
  def self.rank_for_year(data, page, year=2010)        
    #TODO: should add named scope to get conditions
    col="#{data[:caste]}-#{data[:gender]}".underscore
    filters=get_conditions(col,data)
        
    self.paginate :select => "*", :conditions => filters, :page => page, :order => "#{col} asc", :include => [:colleges_course]
  end
  
  private
  def self.get_conditions(col,data)
    rank=data[:rank]
    
    filter_cond=[]
    filters="#{col} >= ? and exam_year_id=2"

    filter_cond << filters
    filter_cond << rank.to_i
        
    affls=data[:affl] 
    unless affls.nil? || affls.empty?   
      affls=affls.collect{|x| x if x!=""}.compact 
      filters = filters + " and affl in (?)"
      filter_cond << affls
    end    
    
    # regs=data[:reg] 
    # unless affls.nil? || regs.empty?   
    #   regs=regs.collect{|x| x if x!=""}.compact 
    #   filters = filters + " and reg in (?)"
    #   filter_cond << regs
    # end
        
    filter_cond
  end  
  
end
