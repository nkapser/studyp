class CollegesController < ApplicationController

  def index
    @title = "Eamcet Colleges in Andhra Pradesh"
    @college=College.new
    @colleges=College.get_all_eamcet_colleges(params[:page])
  end
  
  def new    
    @college=College.new
  end
  
  def create
    @college=College.new(params[:college])
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show    
    @college=College.find(params[:id])
    @title = @college.name
  end
  
  def search    
    @colleges=[]
    college_query=College.without_empty_names
    if !params[:region].nil?
      @title = "Colleges in #{regions(params[:region])}"      
      college_query=college_query.with_region(params[:region])
    end
    
    if !params[:district].nil?
      @title = "Colleges in #{districts(params[:district])} district"      
      college_query=college_query.with_district(params[:district].upcase)
    end
    
    if !params[:affl].nil?
      @title = "Colleges affiliated to #{universities(params[:affl])}"        
      college_query=college_query.affiliated_to(params[:affl])
    end
    
    if !params[:college].nil?
      redirect_to :action => :index and return if params[:college].empty?
      
      @title = "Colleges with name #{params[:college]}"
      college_query=college_query.name_like(params[:college])
    end
    
    @colleges=college_query.paginate :page => params[:page], :order => [:name]
        
    if @colleges.count == 1
      redirect_to :action => :show, :id => @colleges.first
    elsif @colleges.empty?
      redirect_to :action => :index
    else
      render :action => :colleges_result
    end
  end
  
  def colleges_result
  end
  
end
