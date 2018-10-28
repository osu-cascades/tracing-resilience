class Measure < ApplicationRecord
  enum category: [:general, :individual, :relational, :community]
  has_one_attached :document
  validates_presence_of :title, :category, :description
  after_save :ensure_single_featured_measure
  acts_as_taggable

  def self.category_options
    Measure.categories.keys.map { |k| [k.to_s.capitalize, k] }.to_h
  end

  def to_s
    self.title
  end

  private

  def ensure_single_featured_measure
    if self.featured
      Measure.where('id != ?', self.id).update_all("featured = 'false'")
    end
  end

end
