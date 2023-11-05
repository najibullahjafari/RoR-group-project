class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, class_name: 'Ingredient'
  has_many :recipe_foods
  validates :name, presence: true

  def toggle_privacy
    self.public = !public
    save
  end

  def count_ingredients
    ingredients.count
  end
end
