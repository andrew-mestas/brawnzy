class WorkoutapiController < ApplicationController

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
  	render json: params
  end

  def workout_params
    params.permit(:workoutType, :workout_day, :name, :set_amount,  :weekly)
  end
end
