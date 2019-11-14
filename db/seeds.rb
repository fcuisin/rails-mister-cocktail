require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_listing = JSON.parse(ingredient_serialized)
ingredients = ingredient_listing['drinks']

ingredients.each do |ing|
  Ingredient.create(name: ing['strIngredient1'])
end
