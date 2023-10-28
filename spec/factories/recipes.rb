FactoryBot.define do
    factory :recipe do
      name { "Test Recipe" }
      preparation_time { 30 }
      cooking_time { 45 }
      description { "This is a test recipe description." }
      public { true } # Adjusted to set the default as false
  
      association :user, factory: :user
    end
  end
  