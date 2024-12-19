class ProfilesController < ApplicationController
  def preview
    recommendations = ChatgptService.get_recommendations(profile_params)
    render json: recommendations
  end

  def index
    @profiles = Profile.where(user: current_user)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to recipes_path, notice: 'Profile was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

private
  def profile_params
    params.require(:profile).permit(:nickname, :gender, :yourself,:height, :weight, :meals_per_day, :fitness_goal, :meal_plan, :calories_per_day, :protein_per_day, :carbs_per_day, :date_of_birth, :user_id)
  end
end
