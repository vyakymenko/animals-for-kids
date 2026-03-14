class Animal < ApplicationRecord
  validates :name, presence: true
  validates :category, inclusion: { in: %w[Mammals Birds Reptiles Fish Insects] }
end
