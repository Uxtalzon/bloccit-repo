class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved."
    else
      flash[:error] = "There was an error saving the comment. Please try again."
    end
    
    redirect_to [@post.topic, @post]
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  
end

=begin
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
=end