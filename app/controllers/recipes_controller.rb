class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @system_recipes = Recipe.by_system
  end

  # function to render html.erb view
  def show
    @recipe = Recipe.find(params[:id])
    @steps = @recipe.steps.split("\r\n").reject(&:blank?)
    @recipe_json = {
      recipe: @recipe.as_json(include: {
        ingredients_recipes: { include: :ingredient }
      })
    }
    if current_user.present? && current_user.profiles.present?
      @profiles = current_user.profiles
    else
      @profiles = nil
    end
    baskets = Basket.where(user: current_user)
    if baskets.present?
      @basket = baskets.last
    else
      @basket = Basket.create(user: current_user)
    end
    @dates = [Date.today.strftime('%^b %d %A'), (Date.today + 1).strftime('%^b %d %A'), (Date.today + 2).strftime('%^b %d %A')]
    @profiles_json = {profiles: @profiles.as_json}
    @meal = Meal.new(recipe: @recipe, basket: @basket)
  end

  def discover
    @first_recipe = Recipe.all.sample
    @props = {
      initialRecipe: @first_recipe.as_json(include: {
        ingredients_recipes: { include: :ingredient }}),
      nextUrl: random_recipes_path}
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

  def random
    # @recipe = Recipe.where.not(id: current_user.viewed_recipes.pluck(:id)).sample
    @recipe = Recipe.all.sample
    render json: @recipe
  end


end
