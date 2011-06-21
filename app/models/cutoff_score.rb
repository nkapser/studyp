class CutoffScore < ActiveRecord::Base
  belongs_to :course
  belongs_to :college
  belongs_to :exam_year
  
  cattr_reader :per_page
  @@per_page = 25
  
  def self.rank_for_year(data, page, year=2010)        
    #TODO: should add named scope to get conditions
    col="#{data[:caste]}-#{data[:gender]}".underscore
    filters=get_conditions(col,data)
        
    self.paginate :select => "*, colleges.id as college_id ", :conditions => filters, :include => [:college, :course], :page => page, :order => "#{col} asc"
  end
  
  private
  def self.get_conditions(col,data)
    rank=data[:rank]
    
    filter_cond=[]
    filters="#{col} >= ? and exam_year_id=2"

    filter_cond << filters
    filter_cond << rank.to_i
        
    affls=data[:affl] 
    unless affls.nil?    
      affls=affls.collect{|x| x if x!=""}.compact 
      filters = filters + " and affl in (?)" unless affls.empty?      
      filter_cond << affls unless affls.empty?      
    end    
    
    filter_cond
  end  

end
