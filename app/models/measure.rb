class Measure < ApplicationRecord
  enum category: [:general, :individual, :relational, :community]

  def self.category_options
    options = {}
    Measure.categories.keys.each do |k|
      options[k.to_s.capitalize] = k
    end
    options
  end

  has_one_attached :document
  validates_presence_of :title, :category
end
