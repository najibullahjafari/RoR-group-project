FactoryBot.define do
  factory :food do
    name { "Test Food" }
    measurement_unit { 1 }
    price { 9.99 }
    quantity { 10 }

    association :user, factory: :user
  end
end
