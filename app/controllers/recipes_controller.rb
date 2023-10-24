class RecipesController < ApplicationController
    def index
        @recipes = Recipe.where(public: 1)
      end
    def new
    end
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          redirect_to @recipe, flash: { success: 'Recipe saved successfully!' }
        else
          render :new, flash: { error: 'Recipe failed to save!' }
        end
      end      
    def destroy
    end
    private
    def recipe_params
        params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    end
    end
end
