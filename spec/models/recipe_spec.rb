# spec/models/recipe_spec.rb

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'Example User', email: 'user@example.com', password: 'password') }
  let(:recipe) { Recipe.create(user:) }

  it 'belongs to a user' do
    expect(recipe.user).to eq(user)
  end

  it 'toggles privacy' do
    initial_privacy = recipe.public
    recipe.toggle_privacy
    expect(recipe.public).to eq(!initial_privacy)
  end
end
