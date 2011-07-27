class ProfileController < ApplicationController
  def index
    @title = "RailsSpace Profiles"
  end
  def show
     login = params[:login]
     @user = User.find_by_login(login)
#if @user
#@title = "My Wagging Tales Profile for #{tess}"
#else
#flash[:notice] = "No user #{login} at Wagging Tales!"
#redirect_to :action => "index"
#end
end

end
