class FavoritesController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)
    authorize favorite
    
    if favorite.save
      flash[:notice] = "You favorited this post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error favoriting this post."
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites
   # authorize favorite
    
    if favorite.destroy
      flash[:notice] = "You have unfavorited this post."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Error: unable to unfavorite this post."
      redirect_to [@post.topic, @post]
    end
  end
end
