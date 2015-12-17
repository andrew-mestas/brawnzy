class WorkoutapiController < ApplicationController

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

def create
  	render json: workout_params
  	puts weight_sets params

  	workout = Workout.where(workout_params).first_or_create
	workout.save

 	weightList = weight_sets(params).split(',')

 	for i in 0...weightList.length
      set = WorkoutSet.where(workout_id: workout.id, weight: weightList[i], avg_time: '00:00:00').create
      set.save
    end
  end

  def stats
  	stats = Workout.all
  	render json: stats
  end

  def all
  	workouts = Workout.all
  	render json: workouts
  end

  def show
  	workout = Workout.find(params['id'])
  	render json: workout
  end

  private

  def workout_params
    params.permit(:user_id, :workout_type, :name, :set_amount, :weekday, :weekly, :day_index)
  end

  def weight_sets params
      weights = []
    if params['set_amount'].to_i < 2
      weights << params['weight']['0']
    else  

      for i in 0...params['set_amount'].to_i do
        weights << params['weight'][i.to_s]
        end
    end
    weights.join(',')
end

end
