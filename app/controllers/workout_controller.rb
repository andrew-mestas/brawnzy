class WorkoutController < ApplicationController
  def index
  end

  def all
    @time = Time.new
    @workouts = User.find(@current_user.id).workout.where(:day_index =>@time.wday)
    # render json: @workouts
  end

  def new    
     @workout = Workout.new
  end

  def view
    # @workout = Workout.find
  end

  def create

    # render json: params
    workout = Workout.where(workout_params).first_or_create
    workout.user_id = @current_user.id
    workout.day_index = day_index(params['workout']['day_index'])
    workout.save
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

  def day_index day_index
      index = nil

    case day_index
    when 'Monday'
      index = 1
    when 'Tuesday'
      index = 2
    when 'Wednesday'
      index = 3
    when 'Thursday'
      index = 4
    when 'Friday'
      index = 5
    when 'Saturday'
      index = 6
    when 'Sunday'
      index = 0
    else
      index = -1
    end

  index
end
end