FactoryBot.define do
    factory :recipe do
      # Add necessary attributes here
      association :user
      public { false }
      # Any other attributes you want to include
    end
  end
  