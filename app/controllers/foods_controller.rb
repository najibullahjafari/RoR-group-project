class FoodsController < ApplicationController
  before_action :authenticate_user!, :set_food, only: [:destroy]

  def index
    @foods = current_user.foods
    @food = current_user.foods.build
  end

  def show
    @food = Food.find(params[:id])
    redirect_to foods_path
  end

  def create
    @food = current_user.foods.build(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully added.' }
      else
        format.html { render :index }
      end
    end
  end

  def delete_food
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end



  private

  def set_food
    @food = current_user.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
