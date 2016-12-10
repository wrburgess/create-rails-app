module ApplicationHelper
  def page_head_title(title)
    content_for :title, title.to_s
  end

  def page_meta_keywords(keywords)
    content_for :keywords, keywords.to_s
  end

  def page_meta_desc(description)
    content_for :description, description.to_s
  end

  def copyright_notice
    "&copy; 2016 CreateRailsApp"
  end

  def number_with_leading(integer)
    integer.to_s.rjust(2, "0")
  end
end
