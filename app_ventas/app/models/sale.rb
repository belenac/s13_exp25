class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :category, inclusion: %w(uno dos tres cuatro cinco)
  validates :value, numericality: true
  validates :discount, numericality: true, length: { maximum: 40 }
end
