require 'open-uri'


class WorkoutapiController < ApplicationController

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

def create
  	render json: workout_params
  	puts weight_sets params

  	user = User.find_by_name(params[:personName]);

  	workout = Workout.where(workout_params).first_or_create
  	workout.user_id = user.id;
	workout.save

 	weightList = weight_sets(params).split(',')

 	for i in 0...weightList.length
      set = WorkoutSet.where(workout_id: workout.id, weight: weightList[i], avg_time: '00:00:00').create
      set.save
    end
  end

   def getgyms
    puts params
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location="+params['lat'].to_s+","+params['lon'].to_s+"&radius=900&types=gym&key=" + ENV['MAPS_KEY']
    # render json: params
    response = open(url).read
    render json: response
   end

  def stats_data
  	workouts = User.find_by_name(params[:name]).workout
  	weight_sets = []
    
    workouts.each do |w|
     weight_sets << WorkoutSet.where(workout_id: w.id)
    end
  	render json: {workout: workouts, sets: weight_sets}
  end
  
  def user_stats
  	stats = User.find_by_name(params[:name]).workout
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
