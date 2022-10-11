class Review < ApplicationRecord
  belongs_to :trip

  validates :rating, presence: true, numericality: true
  validates :content, presence: true
end
