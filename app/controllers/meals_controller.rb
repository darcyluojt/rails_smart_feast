class MealsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    Rails.logger.debug "Params received: #{params.inspect}"
    if current_user
      @user = current_user
    else
      value = "new_user" + DateTime.now.to_s
      @user = User.create!(email: "#{value}@guest.com", password: value)
    end
    if @user.baskets.present?
      @basket = Basket.where(user: @user).last
    else
      @basket = Basket.create!(user: @user, name: "Basket for #{DateTime.now.strftime('%^b %d %A')}")
    end
    # React UI component create a post request with recipe.id and date
    @meal = Meal.new(meal_params)
    @meal.basket = @basket

    basket_items = @meal.recipe.ingredients_recipes
    if @meal.save
      basket_items.each do |recipe_ingredient|
        @basket.items.create(ingredient: recipe_ingredient.ingredient, quantity: recipe_ingredient.quantity, unit: recipe_ingredient.unit)
      end
      respond_to do |format|
        format.html {
          flash[:notice] = 'Meal was successfully created.'
          redirect_to basket_path(@basket)
        }
        format.json {
          render json: {
          status: 'created',
          basket_url: basket_path(@basket),
          basket_id: @basket.id,
          flash: {
            notice: 'Meal was successfully created.'
          }
        }}
      end
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:recipe_id, :date)
  end
end
