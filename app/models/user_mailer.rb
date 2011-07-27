class UserMailer < ActionMailer::Base
    
  def reminder(user)
    @subject = 'Your login information at WaggingTales.com'
    @body = {}
# Give body access to the user information.
    @body["user"] = user
    @recipients = user.email
    @from = 'xsisemen@climatecalm.org'
  end 

  def message(mail)
    subject mail[:message].subject
    from 'xsisemen@climatecalm.org'
    recipients mail[:recipient].email
    body mail
  end 

  def friend_request(mail)
    subject 'New friend request at WaggingTales.com'
    from 'xsisemen@climatecalm.org'
    recipients mail[:friend].email
    body mail
  end

  def register_confirm(user)
    @subject = 'Welcome to WaggingTales.com'
    @body = {}
# Give body access to the user information.
    @body["user"] = user
    @recipients = user.email
    @from = 'xsisemen@climatecalm.org'
    @confirm = url_for(:host => "localhost:3000",:controller => "stories", :id => user.id)
  end
end
