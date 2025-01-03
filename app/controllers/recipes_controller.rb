class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @system_recipes = Recipe.by_system
  end

  # function to render html.erb view
  def show
    @recipe = Recipe.find(params[:id])
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
