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
    @title = "Eamcet Search Results"
    
    @data=params[:eamcet] || params      
    @data[:affl] = @data[:affl].delete_if{|x| x.empty?} unless (@data[:affl].nil? || @data[:affl].empty?)
    params=@data
    
    @results = CutoffScore.rank_for_year(@data, params[:page])
  end
  
  def aboutus
    @title = "AboutUs"
  end
  
  def disclaimer
    @title = "Disclaimer"
  end
  
end
