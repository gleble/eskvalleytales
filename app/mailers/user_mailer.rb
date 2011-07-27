class UserMailer < ActionMailer::Base  
  default :from => "info@waggingtales.com"  

  def registration_confirmation(user)  
   mail(:to => user.email, :subject => "Registered")  
  end  
end  
