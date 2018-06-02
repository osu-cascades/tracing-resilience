module MeasuresHelper
  def show_new_measure_link_if_admin
    if current_user.admin?
      "#{link_to 'Add a new measure', new_measure_path, class: 'btn btn-primary float-right'}".html_safe
    end
  end
end
