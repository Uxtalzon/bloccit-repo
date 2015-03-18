class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  
  def create
    @comment = Comment.new.current_user.post(params[:id])
  end
  
end
