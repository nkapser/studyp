require 'active_model'

class Contactus
  include ActiveModel::Validations
  validates_presence_of :name, :email, :subject, :description

  attr_accessor :name, :email, :subject, :description, :phone
  
  validates_length_of :description, :maximum   => 500
  validates_length_of :email, :name, :subject, :phone, :maximum   => 50
  
  
  def initialize(params = {})
    @name = params[:name]
    @email = params[:email]
    @subject = params[:subject]
    @description = params[:description]            
  end
    
end