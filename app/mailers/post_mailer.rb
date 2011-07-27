class PostMailer < ActionMailer::Base  

 
 def say_hello(user,recipient,message)  
    @user = user
    @recipient = recipient
    @message = message
    mail(:to => recipient.email, :from => user.email, :subject => "You have mail")  
 end  
end  
