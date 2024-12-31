class ProfilesMealsController < ApplicationController
  def new
    @new = ProfileMeal.new
  end
end
