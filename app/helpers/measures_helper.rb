module MeasuresHelper

  def show_new_measure_link_if_admin
    if current_user.admin?
      "#{link_to 'Add a new measure', new_measure_path, class: 'btn btn-primary float-right'}".html_safe
    end
  end

  def show_measure_count
    count = @measure_count || 0
    measure_count = "#{count} Measure".html_safe
    unless count == 1 then measure_count << 's' end
    measure_count.html_safe
  end
end
