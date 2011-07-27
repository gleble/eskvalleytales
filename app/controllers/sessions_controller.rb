class SessionsController < ApplicationController
  def new
    render :action => 'new'
  end

  def create
    @current_user = User.find_by_login_and_password(
    params[:login], params[:password])
    if @current_user
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    else
      render :action => 'new'
    end
  end

  def show
    session[:user_id] = @current_user = nil
  end
  
  def destroy
    session[:user_id] = @current_user = nil
  end
end