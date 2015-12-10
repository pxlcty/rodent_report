class UsersController < ApplicationController

	before_action :get_user, only: [:show, :edit, :update, :destroy]

  def new
	  redirect_to root_path if current_user
	  @user = User.new
  end

  def create
	  @user = User.new(user_params)

	  if @user.save
		  cookies.permanent[:aut_token] = @user.auth_token
		  redirect_to root_path, notice: "Welcome to Rodent Report!"
	  else
		  render 'new'
	  end
  end

  def show
  end

  def edit
  end

  def update
	  if @user.update(user_params)
		  redirect_to edit_user_path(@user), notice: "Your account has been updated."
	  else
		  render "edit"
	  end
  end

  def destroy
	  @user.destroy
	  redirect_to signout_path, notice: "your account has been deleted."
  end

private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

	def get_user
		@user = current_user
	end

end
