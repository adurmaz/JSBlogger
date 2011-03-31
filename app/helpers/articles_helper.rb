module ArticlesHelper
  def error_message_for_field(object, field)
    unless object.errors[field].empty?
      "This #{object.errors[field].first}"
    end
  end
end
