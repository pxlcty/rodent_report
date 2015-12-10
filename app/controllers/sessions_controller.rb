class SessionsController < ApplicationController

  def new
  end

  def create
	  user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
		  cookies[:auth_token] = user.auth_token
		  redirect_to root_path, notice: "Hi, you've succesfully signed in!"
		else
			flash[:alert] = "Invalid email or password."
			render 'new'
		end
  end

  def destroy
	  cookies.delete(:auth_token)
	  redirect_to root_path
  end

end
