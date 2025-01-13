class MealsController < ApplicationController
  def create
    Rails.logger.debug "Params received: #{params.inspect}"
    if current_user
      @user = current_user
    else
      value = cookies[:guest_selections] + DateTime.now.to_s
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
        @basket.items.create!(ingredient: recipe_ingredient.ingredient, quantity: recipe_ingredient.quantity, unit: recipe_ingredient.unit)
      end
      redirect_to basket_path(@basket)
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:recipe_id, :date)
  end
end
