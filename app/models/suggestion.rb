class Suggestion
  include ActiveModel::Model

  attr_accessor(
    :title,
    :category,
    :reference,
    :description
  )

  validates_presence_of :title, :reference, :description
  validates_presence_of :category, message: 'must be selected'

end
