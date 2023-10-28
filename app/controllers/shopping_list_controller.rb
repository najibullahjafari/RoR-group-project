class ShoppingListController < ApplicationController
  before_action :find_user

  def index
    @user = current_user
    @total_foods = 0
    @total_price = 0
    @recipe_foods = []

    @user.recipes.includes(recipe_foods: :food).each do |recipe|
      # Assuming you have a many-to-many relationship between Recipe and RecipeFood
      recipe.recipe_foods.each do |recipe_food|
        # Calculate the total quantity and price for each recipe_food
        quantity = recipe_food.quantity
        price = recipe_food.food.price * quantity

        # Add to the total count and price
        @total_foods += quantity
        @total_price += price

        # Add to the recipe_foods array
        @recipe_foods << { food: recipe_food.food, quantity: quantity, price: price }
      end
    end
  end

  private

  def find_user
    @user = current_user
  end
end
