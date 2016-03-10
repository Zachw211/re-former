class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(username: params[:username], email: params[:email],
			password: params[:password])
		#@user = User.new(user_params)
		if @user.save
			flash[:success] = "User saved!"
			redirect_to @user
		else
			render 'new'
		end
	end


	private

		def user_params
			params.require(:user).permit(:username,:email,:password)
		end
end


