require 'rails_helper'

RSpec.describe Food, type: :model do
  before do
    @user = User.create(name: 'Najib', email: 'najib@gmail.com', password: 'naji345')
    @egg = Food.create(name: 'egg', measurement_unit: 'kilogram', price: 3, quantity: 1, user: @user)
    @rice = Food.create(name: 'rice', measurement_unit: 'kg', price: 200, quantity: 1, user: @user)
  end

  it 'measurement_unit should be present' do
    @egg.measurement_unit = nil
    expect(@egg).to_not be_valid
  end

  it 'should be valid' do
    expect(@egg).to be_valid
  end

  it 'should have a user' do
    expect(@egg.user).to eq(@user)
  end

  it 'should have a price of 3' do
    expect(@egg.price).to eq(3)
  end

  it 'should have a quantity of 1' do
    expect(@egg.quantity).to eq(1)
  end
end
