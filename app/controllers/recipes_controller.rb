class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, flash: { success: 'Recipe saved successfully!' }
    else
      render :new, flash: { error: 'Recipe failed to save!' }
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, flash: { success: 'Recipe deleted successfully!' }
    else
      redirect_to recipes_path, flash: { error: 'Failed to delete the recipe!' }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
