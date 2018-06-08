class Suggestion
  include ActiveModel::Model

  attr_accessor(
    :title,
    :category,
    :reference,
    :description
  )

  validates_presence_of :title, :category, :reference, :description

end
