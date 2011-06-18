class HomeController < ApplicationController
  def index
    @exam = Exam.find_by_name("BITSAT")
    @colleges = @exam.colleges
  end
  
  def bitsat_results
    #params[:bits][:college] -> selected colleges
    #params[:bits][:score] -> score received
      
    @results=[]
    render :action => :results
  end
end
