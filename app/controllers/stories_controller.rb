class StoriesController < ApplicationController
  def create
     @stories=Story.new(params[:story])
     if @stories.save
       @stories.user_id = @stories.id
       @stories.save
       redirect_to stories_path
     end
  end

  def index
     @story = Story.find(:all)
     @users = User.search(params[:search])
  end

  def edit
    @story = Story.find(params[:id])
  end


  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      redirect_to story_path(@story.id)
    end
  end

  def show
   fetch_user
    @user = User.find(params[:id])
    @users = User.search(params[:search])

  end

  def new
    @story = Story.new
  end

  

  
  


end
