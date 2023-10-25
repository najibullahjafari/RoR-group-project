class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show destroy]
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes
  end

  def show; end

  def destroy
    if current_user == @recipe.user
      @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
    else
      redirect_to recipes_path, alert: 'You do not have permission to delete this recipe.'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
