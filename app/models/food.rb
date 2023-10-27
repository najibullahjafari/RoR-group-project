class Food < ApplicationRecord
  has_many :ingredients
  belongs_to :user
  validates :measurement_unit, presence: true
end
