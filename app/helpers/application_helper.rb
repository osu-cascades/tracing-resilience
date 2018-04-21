module ApplicationHelper
  BASE_TITLE = 'Traces CYRM'.freeze
  def full_title(page_title = '')
    page_title.empty? ? BASE_TITLE : "#{page_title} | #{BASE_TITLE}"
  end
end
