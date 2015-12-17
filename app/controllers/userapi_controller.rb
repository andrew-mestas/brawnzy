class UserapiController < ApplicationController

	protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
 
  def create 
	tempuser = User.find_by_email(user_params[:email])
			if tempuser
				render json: {msg: "User Exists"}
			else
				@user = User.create user_params
				if @user
					# session[:user_id] = @user.id
					# flash[:success] = "User created!!"
					# redirect_to root_path
					render json: {msg: "Created User"}
				else
					render json: {msg: "Credentials Invalid!!"}
					# redirect_to '/users/new'
				end
			end  
	end
		private

	def user_params
	  params.permit(:name, :email, :password, :password_confirmation)
	end

end
