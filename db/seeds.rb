# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "json"
require "open-uri"

Recipe.destroy_all
Ingredient.destroy_all

id = ["52951", "52870", "52975", "52969","52947"]



id.each do |i|
  # parse the food database url for the exact recipe id
  full_url = url + i
  uri = URI.parse(full_url).read
  meals = JSON.parse(uri)["meals"][0]
  name = meals["strMeal"]
  puts "Creating #{name}"
  instructions = meals["strInstructions"]
  category = []
  category << meals["strCategory"]
  category << meals["strArea"]
  thumbnail = meals["strMealThumb"]
  new_recipe = Recipe.new(name: name, steps: instructions, category: category, thumbnail: thumbnail)
  new_recipe.save
  puts "Created #{name}"
  # create recipe ingredients. However, if no ingredients are found, then create the ingredient first with usda api call
  i = 1
  until meals["strIngredient#{i}"].nil?
    break if meals["strIngredient#{i}"].empty?
    ingredient_name = meals["strIngredient#{i}"]
    if Ingredient.find_by(name: ingredient_name)
      ingredient = Ingredient.find_by(name: ingredient_name)
    else
      # later on build a API call to get the calories and protein
      service = NrelService.new
      results = service.search_food(ingredient_name)
      puts "Searching for #{ingredient_name}"
      nutrients = results["foods"][0]["foodNutrients"]
      protein = nutrients.find { |nutrient| nutrient["nutrientId"] == 1003 }
      protein = protein.nil? ? 0 : protein["value"]
      fat = nutrients.find { |nutrient| nutrient["nutrientId"] == 1004 }
      fat = fat.nil? ? 0 : fat["value"]
      carbs = nutrients.find { |nutrient| nutrient["nutrientId"] == 1005 }
      carbs = carbs.nil? ? 0 : carbs["value"]
      calories = nutrients.find { |nutrient| nutrient["nutrientId"] == 1008 }
      calories = calories.nil? ? 0 : calories["value"]
      ingredient = Ingredient.new(name: ingredient_name, calories_unit: calories, protein_unit: protein, fat_unit: fat, carbs_unit: carbs)
      ingredient.save

    end
    quantity = meals["strMeasure#{i}"]
    unit = meals["strMeasure#{i}"].scan(/[a-zA-Z]+/).join
    new_ingredient_recipe = IngredientsRecipe.new(recipe: new_recipe, ingredient: ingredient, quantity: quantity, unit: unit)
    new_ingredient_recipe.save
    puts "Added #{ingredient_name} to #{name}"
    i += 1
  end
end


# Recipe.create([
#   {
#     name: "Spaghetti Bolognese",
#     steps: "1. Cook spaghetti according to package instructions.\n2. In a separate pan, heat oil and sauté onions and garlic.\n3. Add minced meat and cook until browned.\n4. Stir in tomato sauce, season with salt, pepper, and herbs.\n5. Simmer for 20 minutes.\n6. Serve the sauce over the spaghetti and garnish with parmesan."
#   },
#   {
#     name: "Chicken Curry",
#     steps: "1. Heat oil in a pan and sauté onions until golden brown.\n2. Add ginger, garlic, and spices, then cook for 1-2 minutes.\n3. Add chicken pieces and cook until sealed.\n4. Pour in coconut milk and simmer for 25 minutes.\n5. Garnish with fresh coriander and serve with rice."
#   },
#   {
#     name: "Vegetable Stir-Fry",
#     steps: "1. Heat oil in a wok or large pan.\n2. Add garlic and ginger, then stir-fry for 30 seconds.\n3. Add mixed vegetables and cook for 5-7 minutes.\n4. Mix soy sauce, sesame oil, and cornstarch in a bowl, then pour over the vegetables.\n5. Stir-fry for another 2 minutes until sauce thickens.\n6. Serve hot with noodles or rice."
#   },
#   {
#     name: "Pancakes",
#     steps: "1. In a bowl, mix flour, sugar, baking powder, and salt.\n2. In a separate bowl, whisk together milk, eggs, and melted butter.\n3. Gradually add the wet ingredients to the dry ingredients, mixing until smooth.\n4. Heat a non-stick pan and pour batter to form pancakes.\n5. Cook until bubbles form, then flip and cook the other side.\n6. Serve with syrup, fruits, or toppings of choice."
#   },
#   {
#     name: "Caesar Salad",
#     steps: "1. Wash and chop romaine lettuce.\n2. In a bowl, whisk together olive oil, lemon juice, mustard, and grated parmesan for the dressing.\n3. Toss lettuce with the dressing.\n4. Add croutons and sprinkle extra parmesan on top.\n5. Serve immediately."
#   }
# ])
