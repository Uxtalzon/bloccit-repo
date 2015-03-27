class VotesController < ApplicationController
  before_action :load_post_and_vote

  def up_vote
    update_vote!(1)
    redirect_to :back
    # http://apidock.com/rails/ActionController/Base/redirect_to
  end
  
  def down_vote
    update_vote!(-1)
    redirect_to :back      
      # http://apidock.com/rails/ActionController/Base/redirect_to
  end
  
  private
  
  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first
  end
  
  def update_vote!(new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
      @vote = @post.votes.build(value: new_value, post: @post)
      authorize @vote, :create? 
      @vote.save
    end
  end
end