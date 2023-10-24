# db/seeds.rb
require 'faker'

5.times do
  Recipe.create(
    name: Faker::Food.dish,
    preparation_time: rand(5..60),
    cooking_time: rand(30..120),
    description: Faker::Lorem.paragraph,
  )
end
