class Article < ActiveRecord::Base

  validates_presence_of :title, :body
 # validates_presence_of :title, :body

  has_many :comments

  has_many :taggings
  has_many :tags, :through => :taggings

  def allows_comments?
    if title.include?("secret")
      false
    else
      true
    end
  end

  def tag_list
    names = tags.collect do |t|
      t.name
    end
    names.join(", ")
  end

  def tag_list=(input)
    # Nuclear option
    # taggings.destroy_all

    # Cleaner, complicated option
    # We need to know which of tags are not in input
    #   raise input.inspect
    #   input comes in like "Samples, Ruby, rails"
    names = input.split(",").collect{|name| name.strip.downcase}
  #  bads = []
  #  tags.each do |tag|
  #      bads << tag unless names.include?(tag.name)
  #  end
    bads = tags.reject{|tag| names.include?(tag.name)}
    tags.delete(bads)

    names.each do |name|
      tag = Tag.find_or_create_by_name(name)
      tags << tag unless tags.include?(tag)
    end
  end
end
