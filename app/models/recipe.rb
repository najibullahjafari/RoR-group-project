class Recipe < ApplicationRecord
  has_many :ingredients, class_name: 'Ingredient'
  belongs_to :user

  def toggle_privacy
    self.public = !public
    save
  end

  def count_ingredients
    ingredients.count
  end
end

