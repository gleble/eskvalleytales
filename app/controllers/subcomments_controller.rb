class SubcommentsController < ApplicationController
  # GET /subcomments
  # GET /subcomments.xml
  def index
    @subcomments = Subcomment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subcomments }
    end
  end

  # GET /subcomments/1
  # GET /subcomments/1.xml
  def show
    @subcomment = Subcomment.find(params[:id])
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subcomment }
    end
  end

  # GET /subcomments/new
  # GET /subcomments/new.xml
  def new
    @subcomment = Subcomment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @subcomment }
    end
  end

  # GET /subcomments/1/edit
  def edit
    @subcomment = Subcomment.find(params[:id])
  end

  # POST /subcomments
  # POST /subcomments.xml

  def create
    @cuser = @current_user    
    @comment = Comment.find(params[:comment_id])
    @user = User.find(params[@comment.user_id]) 
    @comment.subcomments.create( :commenter => @cuser.login, :user => @user.id, :body => params[:subcomment][:body])
    respond_to do |format|
     format.js  
     format.html {redirect_to user_path} 
    end    
  end

  # PUT /subcomments/1
  # PUT /subcomments/1.xml
  def update
    @subcomment = Subcomment.find(params[:id])

    respond_to do |format|
      if @subcomment.update_attributes(params[:subcomment])
        format.html { redirect_to(@subcomment, :notice => 'Subcomment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subcomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subcomments/1
  # DELETE /subcomments/1.xml
  def destroy
    @subcomment = Subcomment.find(params[:id])
    @subcomment.destroy

    respond_to do |format|
      format.html { redirect_to(subcomments_url) }
      format.xml  { head :ok }
    end
  end
end
