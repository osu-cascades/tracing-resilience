class Measure < ApplicationRecord
  enum category: [:general, :individual, :relational, :community]

  def self.category_options
    options = {}
    Measure.categories.keys.each do |k|
      options[k.to_s.capitalize] = k
    end
    options
  end

  has_attached_file :document
  validates_attachment :document, :content_type => {:content_type => %w(application/pdf application/msword)}
  validates :document, attachment_presence: true

  validates_presence_of :title, :category
end
