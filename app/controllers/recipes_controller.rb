class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @system_recipes = Recipe.by_system
  end

  def show
    @recipe = Recipe.find(params[:id])
    @customize = Recipe.new(name: @recipe.name, steps: @recipe.steps,baseline_id: @recipe.id, user: current_user)
    @ingredients_recipes = @recipe.ingredients_recipes
    @ingredients_recipes.each do |ingredient_recipe|
      @customize.ingredients_recipes.build(ingredient_id: ingredient_recipe.ingredient_id)
    end
  #   client = OpenAI::Client.new
  #   chatgpt_response = client.chat(parameters: {
  #   model: "gpt-4o-mini",
  #   messages: [{ role: "user", content: "Give me a simple recipe for #{@recipe.name} with the ingredients #{@recipe.ingredients}. Give me only the text of the recipe, without any of your own answer like 'Here is a simple recipe'."}]
  # })
  # @content = chatgpt_response["choices"][0]["message"]["content"]
  end


end
