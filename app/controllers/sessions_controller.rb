class SessionsController < ApplicationController
  before_action :logged_in?, only: [:destroy]
	before_action :logged_out?, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.confirm(user_params)
		if @user
			login(@user)
			flash[:notice] = "Successfully logged in"
			redirect_to @user
		else
			flash[:error] = "Incorrect email or password."
			redirect_to new_session_path
		end
	end

	def destroy
		logout
		redirect_to "/"
	end

	private
	def user_params
		params.require(:user).permit(:email, :password)
	end

end
