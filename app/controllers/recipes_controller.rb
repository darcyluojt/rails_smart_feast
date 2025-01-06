class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @system_recipes = Recipe.by_system
  end

  # function to render html.erb view
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_json = {
      recipe: @recipe.as_json(include: {
        ingredients_recipes: { include: :ingredient }
      })
    }
    if current_user.present? && current_user?.profiles.present?
      @profiles = current_user.profiles
    else
      @profiles = nil
    end
    @profiles_json = {profiles: @profiles.as_json}
  end

  def create
    @recipe = Recipe.find(params[:recipe][:baseline_id])
    @new=@recipe.dup
    @new.user = current_user
    @new.name = params[:recipe][:name]
    if @new.save
      redirect_to @new, notice: 'Recipe was successfully copied.'
    else
      render :show
    end

  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :steps, :baseline_id, :user_id, :thumbnail, :category)
  end


end
