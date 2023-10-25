class Food < ApplicationRecord
  belongs_to :user
  validates :measurement_unit, presence: true
end
