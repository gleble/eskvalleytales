class CommentsController < ApplicationController
   def index
     @comments = Comment.all
   end

   def new
    @comment = Comment.new
   end

  def create
    @cuser = @current_user   
    @user = User.find(params[:user_id]) 
    @user.comments.create(:user_id => @user.id, :commenter => @cuser.login,  :body => params[:comment][:body])
    respond_to do |format|
     format.js  
     format.html {redirect_to user_path}     
    end
  end

  def show
     @comments = Comment.find(params[:id])
     @comment = @story.comments.find(:all , :limit => 2 , :order => 'comments.id DESC')
  end

  def delete
  end

end
