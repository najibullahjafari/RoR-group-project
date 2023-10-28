require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  before(:each) do
    @recipe = FactoryBot.create(:recipe) # Create a sample recipe using FactoryBot for testing
    assign(:recipe, @recipe)
    render
  end

  it 'displays recipe details' do
    expect(rendered).to have_content(@recipe.name)
    expect(rendered).to have_content("#{@recipe.preparation_time} minutes")
    expect(rendered).to have_content("#{@recipe.cooking_time} hours")
  end

  it 'displays ingredient list' do
    @recipe.recipe_foods.each do |recipe_food|
      expect(rendered).to have_content(recipe_food.food.name)
      expect(rendered).to have_content(recipe_food.quantity.to_s)
      if recipe_food.food.price.present? && recipe_food.quantity.present?
        expect(rendered).to have_content("$#{recipe_food.food.price * recipe_food.quantity}")
      else
        expect(rendered).to have_content('Price unavailable')
      end
      expect(rendered).to have_button('Delete')
    end
  end
end
