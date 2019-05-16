require 'open-uri'
require 'json'

puts 'destroying all doses and ingredients'
Dose.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
ingredients_list = ingredients['drinks']

puts 'creating ingredients'

ingredients_list.each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

Cocktail.create(name: "mojito")
Cocktail.create(name: "mmai tai")
Cocktail.create(name: "cuba libre")
Cocktail.create(name: "jack and coke")
Cocktail.create(name: "LE wagon special")
