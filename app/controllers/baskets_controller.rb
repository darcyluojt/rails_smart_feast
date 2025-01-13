class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
    @meals = @basket.meals
    @basket_items = @basket.items
  end
end
