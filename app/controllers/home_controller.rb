class HomeController < ApplicationController
  def index
    @recipe = Recipe.all
  end
end
