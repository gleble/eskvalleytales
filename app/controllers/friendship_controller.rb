class FriendshipController < ApplicationController
  include ProfileHelper
  before_filter  :setup_friends

  def create
    Friendship.request(@user, @friend)
    user = @user
    friend = @friend
    MakeMailer.friend_request(user,friend).deliver
    
    flash[:notice] = "Friend request sent."
    redirect_to user_path(@user.id)
  end



  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@friend, @user)
      flash[:notice] = "Friendship with #{@friend.login} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.login}."
    end
    redirect_to user_path(@user.id)
  end

  def decline
    if @user.requested_friends.include?(@friend)
       Friendship.breakup(@user, @friend)
       flash[:notice] = "Friendship with #{@friend.login} declined"
    else
       flash[:notice] = "No friendship request from #{@friend.login}."
    end
    redirect_to user_path(@user.id)
  end

  def cancel
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship request canceled."
    else
      flash[:notice] = "No request for friendship with #{@friend.login}"
    end
    redirect_to user_path(@user.id)
  end

  def delete
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.login} deleted!"
    else
      flash[:notice] = "You aren't friends with #{@friend.login}"
    end
    redirect_to user_path(@user.id)
  end

  def new
    @user = user.find(params[:id])
  end



private
  def setup_friends
    @user = @current_user
    @friend = User.find(params[:id])
  end
  
end
