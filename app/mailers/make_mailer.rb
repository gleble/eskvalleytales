class MakeMailer < ActionMailer::Base
  default :from => "info@waggingtales.com" 
  def friend_request(user,friend)
        @user = user
        @friend = friend
        mail(:to => friend.email, :subject => 'Friendship request') 
  end
end
