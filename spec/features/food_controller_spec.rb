# spec/controllers/foods_controller_spec.rb

require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) } # Assuming you have FactoryBot configured

  before do
    sign_in user # Sign in the user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'creates a new food item' do
      post :create, params: { food: attributes_for(:food) } # Assuming you have a Factory for Food
      expect(response).to redirect_to(foods_path)
      expect(flash[:notice]).to eq('Food was successfully added.')
    end

    it 'fails to create a new food item' do
      post :create, params: { food: attributes_for(:food, name: '') }
      expect(response).to render_template(:index)
      expect(flash[:alert]).to eq('Failed to create food item.')
    end
  end

  describe 'DELETE #destroy' do
    let(:food) { create(:food, user: user) }

    it 'destroys a food item' do
      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
      expect(flash[:notice]).to eq('Food item was successfully deleted.')
    end

    it 'fails to destroy a food item' do
      # Simulate a failure to destroy the food item
      allow_any_instance_of(Food).to receive(:destroy).and_return(false)

      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
      expect(flash[:alert]).to eq('Failed to delete food item.')
    end
  end

  # Add similar tests for other actions

end
