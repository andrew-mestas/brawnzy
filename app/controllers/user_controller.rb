class UserController < ApplicationController
  def new
  	@user = User.new
  end

  def create 
	tempuser = User.find_by_email(user_params[:email])
			if tempuser
				flash[:danger] = "User Already Exists"
				redirect_to '/users/new'
			else
				@user = User.create user_params
				if @user
					session[:user_id] = @user.id
					flash[:success] = "User created!!"
					redirect_to root_path
				else
					flash[:danger] = "Credentials Invalid!!"
					redirect_to '/users/new'
				end
			end  
	end

	private

	def user_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
