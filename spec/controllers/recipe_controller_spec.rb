# spec/controllers/recipes_controller_spec.rb

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }

  describe 'GET #show' do
    it 'assigns @recipe' do
      get :show, params: { id: recipe.id }
      expect(assigns(:recipe)).to eq(recipe)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new recipe' do
        sign_in user
        expect do
          post :create, params: { recipe: attributes_for(:recipe) }
        end.to change(Recipe, :count).by(1)
      end

      it 'redirects to the created recipe' do
        sign_in user
        post :create, params: { recipe: attributes_for(:recipe) }
        expect(response).to redirect_to(Recipe.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new recipe' do
        sign_in user
        expect do
          post :create, params: { recipe: attributes_for(:recipe, name: nil) }
        end.to_not change(Recipe, :count)
      end

      it 're-renders the :new template' do
        sign_in user
        post :create, params: { recipe: attributes_for(:recipe, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe' do
      sign_in user
      recipe_to_delete = create(:recipe, user:)
      expect do
        delete :destroy, params: { id: recipe_to_delete.id }
      end.to change(Recipe, :count).by(-1)
    end
  end
end
