# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

# puts 'Creating 10 fake ingredients...'
# 10.times do
#   ingredient = Ingredient.new(
#     name:    Faker::Food.ingredient
#   )
#   if ingredient.save
#     ingredient.save!
#   end
# end
# puts 'Finished!'

# puts 'Creating 10 fake cocktails...'
# 10.times do
#   cocktail = Cocktail.new(
#     name:    Faker::Food.dish
#   )
#   if cocktail.save
#     cocktail.save!
#   end
# end
# puts 'Finished!'

# puts 'Creating 10 fake doses...'
# 10.times do
#   dose = Dose.new(
#     description: "#{rand(10..30)} cl",
#     cocktail: Cocktail.all.sample,
#     ingredient: Ingredient.all.sample
#   )
#   if dose.save
#     dose.save!
#   end
# end
# puts 'Finished!'

response = RestClient.get(Ingredient::URL)

json = JSON.parse(response.body, symbolize_names: true)

json[:drinks].each do |drink|
  Ingredient.create!(name: drink[:strIngredient1])
  puts drink[:strIngredient1]
end
