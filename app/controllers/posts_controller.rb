class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end
    
  def create
     @post = current_user.posts.build(post_params)
     @topic = Topic.find(params[:topic_id])
     @post.topic = @topic
     authorize @post
   if @post.save
       flash[:notice] = "Post was saved."
       redirect_to [@topic, @post]
   else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
   end
 end


  def edit
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
  end
  
  def update
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    authorize @post
     if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
  
  def destroy
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    title = @post.title
    authorize @post
    
    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show      
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
