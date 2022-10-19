class Trip < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_one_attached :cover_picture

    validates :title,
              :starting_city_name,
              :starting_city_zipcode,
              :starting_street_address,
              :ending_city_name,
              :ending_city_zipcode,
              :ending_street_address,
              :cover_picture,
              presence: true

    validates :short_description, presence: true, length: {minimum: 20 }
    validates :difficulty, :length, presence: true, numericality: { only_integer: true }
end
