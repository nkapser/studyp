class HomeController < ApplicationController
  def index
  end
  
  def bitsat_results
  end
  
  def eamcet_index
    
  end
  
  def eamcet_results
    if request.get?
      render :action => :eamcet_index
      return
    end
    
    @data=params[:eamcet] || params
    row="#{@data[:caste]}-#{@data[:gender]}".underscore
    rank=@data[:rank]
    @results = CutoffScore.paginate :select => "colleges.id as college_id ", :conditions => ["#{row} >= ?",rank], :include => [:college, :course], :page => params[:page]
  end
end
