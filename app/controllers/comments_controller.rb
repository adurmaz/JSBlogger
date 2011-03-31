class CommentsController < ApplicationController

def create

  article = Article.find params[:comment][:article_id]
  if article.allows_comments?
    # make a new instance with the param's hash
    comment = Comment.new(params[:comment])

    # Save it
    comment.save

    #Redirect to the article's show
    redirect_to article_path(comment.article)
  else
    flash[:notice] = "You can't comment onthat article!"
    redirect_to  articles_path
  end
end

end

