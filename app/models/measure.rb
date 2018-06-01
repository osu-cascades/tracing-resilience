class Measure < ApplicationRecord
  enum category: [:general, :individual, :relational, :community]
  has_one_attached :document
  validates_presence_of :title, :category

  def self.category_options
    Measure.categories.keys.map { |k| [k.to_s.capitalize, k] }.to_h
  end

end
