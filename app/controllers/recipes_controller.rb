class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
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

    unless @recipe.user == current_user
      redirect_to recipes_path, flash: { error: 'You are not authorized to perform this action.' }
      return
    end

    if @recipe.destroy
      redirect_to recipes_path, flash: { success: 'Recipe deleted successfully!' }
    else
      redirect_to recipes_path, flash: { error: 'Failed to delete the recipe!' }
    end
  end

  def toggle_privacy
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      @recipe.toggle_privacy
      redirect_to recipe_path(@recipe)
    else
      redirect_to root_path, alert: 'You do not have permission to do this.'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
