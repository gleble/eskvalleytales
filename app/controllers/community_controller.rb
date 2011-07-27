class CommunityController < ApplicationController
  def index
    @title = "Community"
    @letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
      if params[:id]
        @initial = params[:id]
        user = User.find(:all,
        :conditions => ["login like ?", @initial+'%'])
        @users = user.collect { |user| user.login }
      end
  end

  def browse
  end

 
end
