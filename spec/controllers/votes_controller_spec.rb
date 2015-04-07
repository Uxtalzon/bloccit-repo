require 'rails_helper'

describe VotesController do
  
  include TestFactories
  include Devise::TestHelpers
  
  describe '#up_vote' do
    xit "adds an up-vote to the post"  do
      request.env["HTTP_REFERER"] = '/'
      @user = authenticated_user
      @post = associated_post
      sign_in @user
      
      expect {
        post(:up_vote, post_id: @post.id, topic_id_: @post.topic_id)        
        }.to change{@post.up_votes}.by 1
    end
  end
end
    