require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before do
    @user = User.create(name: 'Najib', email: 'najib@gmail.com', password: 'naji345')
    @egg = Food.create(name: 'egg', measurement_unit: 'kilogram', price: 3, quantity: 1, user: @user)
    @rice = Food.create(name: 'rice', measurement_unit: 'kg', price: 200, quantity: 1, user: @user)

    @eggs_recipe = Recipe.create(name: 'agg with rice', preparation_time: 3, cooking_time: 15,
                                 description: '3 eggs with 2 rice', public: true, user: @user)

    @required_eggs = RecipeFood.create(quantity: 3, recipe: @eggs_recipe, food: @egg)
    @required_rice = RecipeFood.create(quantity: 2, recipe: @eggs_recipe, food: @rice)
  end

  it 'eggs should have a quantity of 3' do
    expect(@required_eggs.quantity).to eq(3)
  end

  it 'rice should have a quantity of 2' do
    expect(@required_rice.quantity).to eq(2)
  end

  it 'eggs should have a recipe' do
    puts 'evaluating failure'
    expect(@required_eggs.recipe).to eq(@eggs_recipe)
  end

  it 'jams should have a recipe' do
    expect(@required_rice.recipe).to eq(@eggs_recipe)
  end

  it 'eggs should have a food' do
    expect(@required_eggs.food).to eq(@egg)
  end

  it 'jams should have a food' do
    expect(@required_rice.food).to eq(@rice)
  end
end
