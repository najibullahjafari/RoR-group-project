5.times do
  recipe = Recipe.new(
    name: Faker::Food.dish,
    preparation_time: rand(5..60),
    cooking_time: rand(30..120),
    description: Faker::Lorem.paragraph,
    user_id: 1,
    public: true
  )
  recipe.save
  puts "Created recipe: #{recipe.name}"
end
