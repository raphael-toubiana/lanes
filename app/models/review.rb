class Review < ApplicationRecord
  belongs_to :trip

  validates :rating, presence: true, numericality: { less_than_or_equal_to: 10,  only_integer: true }
  validates :content, presence: true, length: { minimum: 20 }
end
