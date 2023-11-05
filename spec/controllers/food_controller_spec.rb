# spec/controllers/foods_controller_spec.rb

require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new food' do
        sign_in user
        expect do
          post :create, params: { food: attributes_for(:food) }
        end.to change(Food, :count).by(1)
      end

      it 'redirects to foods index' do
        sign_in user
        post :create, params: { food: attributes_for(:food) }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new food' do
        sign_in user
        expect do
          post :create, params: { food: attributes_for(:food, name: nil) }
        end.to change(Food, :count)
      end
    end
  end

  describe 'GET #index' do
    it 'assigns @foods' do
      sign_in user
      food = create(:food, user:)
      get :index
      expect(assigns(:foods)).to eq([food])
    end
  end

  describe 'GET #show' do
    it 'redirects to foods path' do
      sign_in user
      food = create(:food, user:)
      get :show, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      sign_in user
      food_to_delete = create(:food, user:)
      expect do
        delete :destroy, params: { id: food_to_delete.id }
      end.to change(Food, :count).by(-1)
    end
  end
end
