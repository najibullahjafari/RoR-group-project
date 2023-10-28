class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
    @total_foods = Food.count
    @total_price = Food.sum(:price)
    respond_to do |format|
      format.html
      format.json { render json: @recipes }
    end
  end
end
