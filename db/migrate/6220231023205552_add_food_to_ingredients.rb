class AddFoodToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_reference :ingredients, :food, null: false, foreign_key: true
  end
end
