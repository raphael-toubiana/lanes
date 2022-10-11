class Trip < ApplicationRecord
    has_many :reviews, dependent: :destroy
end
