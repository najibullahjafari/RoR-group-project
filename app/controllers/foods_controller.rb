class FoodsController < ApplicationController
  before_action :set_food, only: [:destroy]
  before_action :authenticate_user!

  def index
    @foods = current_user.foods
    @food = current_user.foods.build
  end

  def show
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

   def destroy
    food_targeted = Food.find(params[:id])
    return unless food_targeted.destroy
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
