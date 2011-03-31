class ArticlesController < ApplicationController
  def index
    @tag, @articles = Tag.articles_for(params[:tag])
  end

  def show
   @article = Article.find params[ :id]
  end

  def edit
    @article = Article.find params[ :id]
  end

  def update

    #raise "break!"

    # Find the article
    @article = Article.find params[ :id]

    # Update the data
    # METHOD 1
    #  @article.body = params[ :article][:body]
    #  @article.title = params[ :article][:title]
    #  @article.save

    # METHOD 2
    # @article.update_attributes(:title => params[:article][:title],
     #                           :body => params[:article][:body])


    # METHOD 3
    @article.update_attributes(params[:article])

    flash[:notice] = "#{@article.title} has been updated."

    # Send them to the show page
    redirect_to article_path(@article)
  end


  def new
    @article = Article.new
  end

  def create
     #Ctreate a new article with new values and save
    @article = Article.new(params[:article])
    if (@article.save)
      flash[:notice] = "#{@article.title} has been created."
      # Redirect to te new article
      redirect_to article_path(@article)
    else
      flash[:notice] = "Article failed to save."

      # instead of redirecting to a new page, maintains whatever is
      # currently in the form
      render :new
    end
  end

  def destroy
   # raise "Bang!"
    @article = Article.find(params[:id])

    # destroy will delete it from the dB, but the obj is still in memory
    @article.destroy

    # flash is s a method that returns a hash
    flash[:notice] = "The article #{@article.title} was destroyed."

    redirect_to articles_path

  end
end
