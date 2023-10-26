class ShoppingListController < ApplicationController
  def show
    @foods = current_user.foods
    @shopping_list = Hash.new { |hash, key| hash[key] = { quantity: 0, price: 0 } }

    # Loop through the food items and calculate the shopping list
    @foods.each do |food_name, food|
      if food.present? && food.respond_to?(:quantity) && food.respond_to?(:price) && food.quantity && food.price
        # If food is available and has non-nil quantity and price attributes, add it to the shopping list
        @shopping_list[food_name][:quantity] += food.quantity
        @shopping_list[food_name][:price] += food.price * food.quantity
      end
    end

    # Calculate the total amount of items in the shopping list
    @total_items = @shopping_list.values.sum { |item| item[:quantity] }

    # Calculate the total price of the shopping list
    @total_price = @shopping_list.values.sum { |item| item[:price] }
        puts "Debug: @shopping_list = #{@shopping_list}"

    render 'show'
  end
end
