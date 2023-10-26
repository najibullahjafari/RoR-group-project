class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)

    respond_to do |format|
      format.html
      format.json { render json: @recipes }
    end
  end
end
