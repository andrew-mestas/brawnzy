class UserapiController < ApplicationController

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
 
  def create 
	tempuser = User.find_by_email(user_params[:email])
			if tempuser
				render json: {msg: "User Exists", status: "Error"}
			else
				@user = User.create(name: user_params[:name],
									email: user_params[:email], 
									password: user_params[:clientID],
									password_confirmation: user_params[:clientID])
				if @user
					# session[:user_id] = @user.id
					# flash[:success] = "User created!!"
					# redirect_to root_path
					@user.save
					render json: {msg: "Created User", status: "OK", token: params}
				else
					render json: {msg: "Credentials Invalid!!", status: "Error"}
					# redirect_to '/users/new'
				end
			end  
	# render json: user_params
	end
	
	private

	def user_params
	  params.permit(:name, :email, :clientID)
	end

end
