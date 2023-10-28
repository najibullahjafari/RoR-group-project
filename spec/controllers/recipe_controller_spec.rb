# spec/controllers/recipes_controller_spec.rb

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new recipe' do
        recipe_params = FactoryBot.attributes_for(:recipe) # Assuming you have a Recipe factory set up
        expect {
          post :create, params: { recipe: recipe_params }
        }.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        recipe_params = FactoryBot.attributes_for(:recipe)
        post :create, params: { recipe: recipe_params }
        expect(response).to redirect_to(Recipe.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new recipe' do
        recipe_params = FactoryBot.attributes_for(:recipe, name: nil) # Assuming name is a required field
        expect {
          post :create, params: { recipe: recipe_params }
        }.to_not change(Recipe, :count)
      end

      it 're-renders the new method' do
        recipe_params = FactoryBot.attributes_for(:recipe, name: nil)
        post :create, params: { recipe: recipe_params }
        expect(response).to render_template(:new)
      end
    end
  end
end
