module MeasureHelper
  def show_measure_links(measure)
    if current_user.admin?
      "#{link_to measure.title, measure} - #{link_to 'Edit', edit_measure_path(measure)} | #{link_to 'Destroy', measure, method: :delete, data: { confirm: 'Are you sure?' }}".html_safe
    else
      "#{link_to measure.title, measure}".html_safe
    end
  end
end