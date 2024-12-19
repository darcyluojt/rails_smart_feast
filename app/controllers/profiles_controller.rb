class ProfilesController < ApplicationController
  def preview
    recommendations = ChatgptService.get_recommendations(preview_params)
    puts recommendations
    render json: recommendations
  end

  def index
    @profiles = Profile.where(user: current_user)
  end

  def new
    @profile = Profile.new
  end

private
  def preview_params
    params.require(:profile).permit(:gender, :height, :weight, :meals_per_day, :fitness_goal, :meal_plan)
  end
end
