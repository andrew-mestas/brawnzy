class OauthController < ApplicationController
  def callback
  	provider_user = request.env['omniauth.auth']

  	# find or create a user
  	user = User.find_or_create_by(provider_id: provider_user['uid'], provider: params[:params]) do |u|
  		u.provider_hash = provider_user['credentials']['token']
  		u.name = provider_user['info']['name']
  		u.email = provider_user['info']['email']
  		u.password = u.password_confirmation = SecureRandom.urlsafe_base64(n=6)
  	end
  	#store user inside of session
  	session[:user_id] = user.user_id
  	redirect_to root_path
  end

  def logout
  	session[:user_id] = nil
  	redirect_to root_path
  end

  def failure
  	# display error page
  	render plain: "This is a failure"
  end
end
