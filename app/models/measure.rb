class Measure < ApplicationRecord
  enum category: [:general, :individual, :relational, :community]
  validates_presence_of :title, :category
end
