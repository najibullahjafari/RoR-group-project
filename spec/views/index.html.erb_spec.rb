require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  before(:each) do
    assign(:recipes, []) # Replace with appropriate recipes using FactoryBot for testing
  end

  context 'when there are no recipes' do
    it 'displays a message if there are no recipes' do
      render
      expect(rendered).to have_content('There are no recipes created yet')
    end
  end
end
