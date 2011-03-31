class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :articles, :through => :taggings

  def self.articles_for(tag_name)
    # called like Tag.articles_for
    #  instead of t.articles_for
    if tag_name
      # Filter by tag
      tag = Tag.find_by_name(tag_name)
      if tag.nil?
         # redirect_to articles_path
        articles = []
      else
        articles = tag.articles
      end
    else
      # Show all articles
      articles = Article.all
    end

    return [tag, articles]
  end

  def self.active
   Tag.all.select{|t| t.articles.count > 0}

  end
end
