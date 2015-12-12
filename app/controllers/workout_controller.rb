class WorkoutController < ApplicationController
  def index
  end

  def all
    # @workouts = Workout.all
  end

  def new    
  end

  def view
    # @workout = Workout.find()
  end

  def create
    render json: params
    # Workout.new()
    # redirect_to "/workout/all"
  end

  def show
  end

  def stats
    # Workout.all()
    # functions
  end

  def nearme
    # geolocation
  end
end
