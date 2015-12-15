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

  def time
    data = params
    times = data['times']
    
    set = WorkoutSet.where(workout_id: data['id'])
    for i in 0...set.length
    set[i].avg_time = Time.at(times[i].to_i).utc.strftime("%H:%M:%S")
    set[i].save
    end

    respond_to do |format|
    format.html { redirect_to '/workout/all' }
    # msg = { :status => "ok", :message => "Success!"}
    # format.json  { render :json => msg } # don't do msg.to_json
   end
  end

  def view
    # @workout = Workout.find
  end

  def create

    workout = Workout.where(workout_params).first_or_create
    workout.user_id = @current_user.id
    workout.day_index = day_index(params['workout']['day_index'])
    workout.save
    num = set_params(params)[:V]
    weightList = set_params(params)[:P].split(',')

    for i in 0...num['set_amount'].to_i
      set = WorkoutSet.where(workout_id: workout.id, weight: weightList[i]).create
      set.save
    end
    redirect_to "/workout/all"
  end

  def show
    @workout = Workout.where(id: params['id']).select(:id, :name, :workout_type, :weekday, :weekly).take
    @sets = WorkoutSet.where(workout_id: @workout.id)
    @workout = JSON.parse(@workout.to_json)

    # render json: @sets

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
    params.require(:workout).permit(:workout_type, :name, :set_amount, :weekday, :weekly)
  end

  def set_params p
    @Vparams = params.require(:workout).permit(:id, :set_amount)
    @Lparams = weight_sets p['workout']
    {:V => @Vparams,:P => @Lparams}
  end

  def weight_sets params
      weights = []
    if params['set_amount'].to_i < 2
      weights << params['weight_0']
    else  

      for i in 0...params['set_amount'].to_i do
        index = "weight_" + i.to_s
        weights << params[index] 
        end
    end
    weights.join(',')
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