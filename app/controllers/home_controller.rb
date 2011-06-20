class HomeController < ApplicationController
  def index
  end
  
  def bitsat_results
  end
  
  def eamcet_index
    
  end
  
  def eamcet_results
    if request.get? and params.empty?
      render :action => :eamcet_index
      return
    end
    
    @data=params[:eamcet] || params
    @data[:affl] = @data[:affl].delete_if{|x| x.empty?}
    params=@data
    filters=get_conditions
    @results = CutoffScore.paginate :select => "colleges.id as college_id ", :conditions => filters, :include => [:college, :course], :page => params[:page]
  end
  
  private
  def get_conditions
    row="#{@data[:caste]}-#{@data[:gender]}".underscore
    rank=@data[:rank]
    
    filter_cond=[]
    filters="#{row} >= ?"
    
    affls=@data[:affl]
    affls=affls.collect{|x| x if x!=""}.compact
    
    filters = filters + " and affl in (?)" unless affls.empty?

    filter_cond << filters
    filter_cond << rank.to_i
    filter_cond << affls unless affls.empty?
    filter_cond
  end
end
