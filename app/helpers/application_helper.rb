module ApplicationHelper
  def tag_links(tags)
    # Output:
    #  tag1, tag2, tag3 (where each is a tag)
    tags.collect do |tag|
      link_to tag.name, articles_path(:tag => tag.name)
    end.join(", ")
  end
end
