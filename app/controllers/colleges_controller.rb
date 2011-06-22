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
    @colleges=College.paginate :conditions => ["name like ?", "%#{params[:college][:name]}%"], :page => params[:page]
    if @colleges.count == 1
      redirect_to :action => :show, :id => @colleges.first
    else
      render :action => :colleges_result
    end
  end
  
  def colleges_result
  end
  
  def region    
    @colleges=College.paginate :conditions => ["reg = ?",params[:region]], :page => params[:page]
    render :action => :colleges_result
  end
  
end
