class EmailController < ApplicationController
  def remind
    if param_posted?(:user)
      email = params[:user][:email]
      user = User.find_by_email(email)
      if user
        NewMailer.registration_confirmation(user).deliver 
        flash[:notice] = "Login information was sent."
        redirect_to new_sessions_path
     end
    end
  end

  def new
    @story = Story.find(params[:id])
  end
 
  def correspond
    @user = @current_user
    user = User.find(params[:id])
    @recipient = user
    @title = "Email" 
    if param_posted?(:message)
      @message = Message.new(params[:message])
      if @message.valid?
          PostMailer.say_hello(@user, @recipient, @message).deliver
          flash[:notice] = "Email sent."
          redirect_to user_path(@user)
      end
    end
  end
end

