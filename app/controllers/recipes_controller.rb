class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @system_recipes = Recipe.by_system
  end

  def show
    @recipe = Recipe.find(params[:id])
    # duplicate the recipe to create a new one
    @new = Recipe.new(
      name: "Copy of " + @recipe.name + " " + Time.now.strftime("%Y-%m-%d"),
      steps: @recipe.steps,
      baseline_id: @recipe.id,
      user: current_user,
      thumbnail: @recipe.thumbnail,
      category: @recipe.category
    )

    # @ingredients = @recipe.ingredients
    # @recipe.profiles_meals.build
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
