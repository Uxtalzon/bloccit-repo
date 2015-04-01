class FavoriteMailer < ActionMailer::Base
  default from: "uxtalzon@gmail.com"
  
  def new_comment(user, post, comment)
    
    # Headers
    headers["Message-ID"] = "<comments/#{comment.id}@jolly-good-show-33-188125.use1-2.nitrousbox.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@jolly-good-show-33-188125.use1-2.nitrousbox.com>"
    headers["References"] = "<post/#{post.id}@jolly-good-show-33-188125.use1-2.nitrousbox.com>"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
