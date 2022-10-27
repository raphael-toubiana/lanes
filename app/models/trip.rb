class Trip < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :trip_locations, dependent: :destroy
    has_many :locations, through: :trip_locations
    has_one_attached :cover_picture

    validates :title, presence: true

    validates :short_description, presence: true, length: {minimum: 20 }
    validates :difficulty, :length, presence: true, numericality: { only_integer: true }
end
