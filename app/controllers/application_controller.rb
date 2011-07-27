# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :fetch_logged_in_user
 
  def param_posted?(symbol)
    request.post? and params[symbol]
  end

  def logged_in?
    not session[:user_id].nil?
  end



  def fetch_user
    @user = User.find(params[:id])
    @user = @user
  end

  def fetch_friend
    @user = User.find(params[:id])
    @friend = @user
  end 
  
protected
  def fetch_logged_in_user
    return unless session[:user_id]
    @current_user = User.find_by_id(session[:user_id])
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '57ee39a11755d1c71b829d6f04b1cd1f'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
