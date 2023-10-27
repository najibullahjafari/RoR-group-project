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
        @total_foods += 1
        @total_price += recipe_food.food.price * recipe_food.quantity
        @recipe_foods << recipe_food
      end
    end
  end

  private

  def find_user
    @user = current_user
  end
end
