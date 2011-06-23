class CollegesController < ApplicationController

  def index
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
  end
  
  def search    
    @colleges=[]
    if !params[:college].nil? 
      @colleges=College.name_like(params[:college]).paginate :page => params[:page]
    end
    
    if !params[:region].nil?
      @colleges=College.with_region(params[:region]).paginate :page => params[:page]
    end
    
    if !params[:district].nil?
      @colleges=College.with_district(params[:district]).paginate :page => params[:page]
    end    
    
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
