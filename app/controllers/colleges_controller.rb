class CollegesController < ApplicationController

  def index
    @college=College.new
    @colleges=College.find(:all)
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
  
end
