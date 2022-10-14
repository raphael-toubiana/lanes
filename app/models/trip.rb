class Trip < ApplicationRecord
    has_many :reviews, dependent: :destroy

    validates :title, presence: true
    validates :short_description, presence: true, length: {minimum: 20 }
end
