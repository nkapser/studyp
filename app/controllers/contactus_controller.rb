class ContactusController < ApplicationController
  
  def new    
    @contactus = Contactus.new
  end
  
  def show
  end
  
  def thankyou
    @contactus = Contactus.new(params[:contactus])
    if @contactus.valid?
      ContactusMailer.contactus_email(@contactus).deliver
    else
      render :action => :new
    end    
  end
end
