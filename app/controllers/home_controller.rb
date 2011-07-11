class HomeController < ApplicationController
  def index
  end
  
  def bitsat_results
  end
  
  def eamcet_index
    @title = "Eamcet Colleges"
    @news_items=NewsItem.find(:all, :order => 'date desc', :limit => 8)
  end
  
  def eamcet_results
    # if request.get? and params[:page].nil?
      # redirect_to :action => :eamcet_index and return
    # end
    @title = "Eamcet Search Results"
    
    @data=params[:eamcet] || params        
    @data[:affl] = @data[:affl].delete_if{|x| x.empty?} unless (@data[:affl].nil? || @data[:affl].empty?)
    params=@data
    
    @results = CutoffScore.rank_for_year(@data, params[:page])
  end
  
end
