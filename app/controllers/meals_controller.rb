class MealsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    if current_user
      @user = current_user
    else
      @user = User.create_guest_user
      sign_in(@user)
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

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    items = @meal.basket.items
    items.each do |item|
      item.destroy
    end
    redirect_to basket_path(@meal.basket)
  end

  private

  def meal_params
    params.require(:meal).permit(:recipe_id, :date)
  end
end
