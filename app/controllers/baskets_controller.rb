class BasketsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @basket = Basket.find(params[:id])
    @meals = @basket.meals
    @basket_items = @basket.items
  end
end
