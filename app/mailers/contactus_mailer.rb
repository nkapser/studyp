class ContactusMailer < ActionMailer::Base
  default :from => "contactus@eamcetcolleges.com"
  
  def contactus_email(user_data)
    @user_data = user_data
    mail(:from => user_data.email, :to => "prudhvi1012@gmail.com", :cc => "kapse.naresh@gmail.com", :subject => user_data.subject)
  end
  
end