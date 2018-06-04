module MeasuresHelper

  def new_measure_link
    "#{link_to 'Add a new measure', new_measure_path, class: 'btn btn-primary float-right'}".html_safe
  end

end
