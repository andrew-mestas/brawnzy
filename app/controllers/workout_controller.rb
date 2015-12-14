class WorkoutController < ApplicationController
  def index
  end

  def all
    @workouts = User.all.second.workout
    # render json: @workouts
  end

  def new    
     @workout = Workout.new
  end

  def view
    # @workout = Workout.find
  end

  def create
    Workout.where(workout_params).first_or_create
    # render json: workout_params
    redirect_to "/workout/all"
  end

  def show
    @workout = Workout.where(id: params['id']).select(:id, :name, :workout_type, :set_amount, :weight, :weekday, :weekly).take
    @workout = JSON.parse(@workout.to_json)
    # render json: @workout

  end

  def stats
    # Workout.all()
    # functions
  end

  def nearme
    # geolocation
  end

  private

  def workout_params
    params.require(:workout).permit(:workout_type, :name, :set_amount, :weight, :weekday, :weekly)
  end
end
