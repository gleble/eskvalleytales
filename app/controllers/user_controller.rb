class UserController < ApplicationController
  def index
    @users = User.all
  end

  def remind
    if param_posted?(:user)
      email = params[:user][:email]
      user = User.find_by_email(email)
      if user
        UserMailer.reminder(user).deliver 
        flash[:notice] = "Login information was sent."
     end
    end
  end

  def show
    @logged_in_user = User.find(session[:user_id]) if logged_in?
  end
  
  def param_posted?(symbol)
    request.post? and params[symbol]
  end

  def new
    if params[:query]
      @users = User.search(params[:query])
    else
      @users = []
    end
  end

  
  def register
    @title = "Register"
    if request.post? and params[:user]
       @user = User.new(params[:user])
       NewMailer.registration_confirmation(user).deliver 
       flash[:notice] = "Login information was sent."
       if @user.save
         flash[:notice] = "User created" 
         redirect_to :action => "register", :controller => "user"
       end
    end     
  end
 
  def confirm
     email = params[:user][:email]
     user = User.find_by_email(email)
  end

  

end
