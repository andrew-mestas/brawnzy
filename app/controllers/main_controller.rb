class MainController < ApplicationController

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
  end

  def api
  	render json: {status: "OK", msg: "Welcome to Brawnzy"}
  end
end
