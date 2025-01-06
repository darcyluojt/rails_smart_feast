class Api::V1::RecipesController < Api::V1::BaseController
  def show
    recipe = Recipe.find(params[:id])
    render json: {
      recipe: recipe.as_json(include: {
        ingredients_recipes: {include: :ingredient}}),
      profile: current_user.profiles
  }
  end
end
