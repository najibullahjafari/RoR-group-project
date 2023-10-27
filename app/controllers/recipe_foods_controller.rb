class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show destroy]

  def index
    @recipe_foods = RecipeFood.all
  end

  def show
    @recipe_foods = RecipeFood.where(recipe_id: params[:id])
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = params[:recipe_food][:recipe_id]

    if @recipe_food.save
      flash[:notice] = 'Ingredient was successfully added to the recipe.'
      redirect_to recipe_path(@recipe_food.recipe_id)
    else
      flash.now[:alert] = 'Something went wrong! Ingredient was not added to the recipe.'
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(@recipe_food.recipe_id)

    if @recipe_food.destroy
      flash[:notice] = 'Ingredient was successfully removed from the recipe.'
    else
      flash[:alert] = 'Something went wrong! Ingredient was not removed from the recipe.'
    end

    redirect_to recipe_path(@recipe.id)
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id, :measurement_unit_id)
  end
end
