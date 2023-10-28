require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  it 'renders the new recipe form' do
    assign(:recipe, Recipe.new)

    render

    expect(rendered).to have_selector('form')
  end
end
