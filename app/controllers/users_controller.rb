class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def show
		@profile = Profile.find_by(user_id: params[:id])
		redirect_to profile_path(@profile.id)
	end
	def create
		if params[:password] != params[:password2]
			flash[:alert] = "Enter the same password twice."
			redirect_to root_path
		end

		@user = User.new(user_params)
		if @user.save
			Profile.create(user_id: @user.id, email: params[:email])
			session[:user_id] = @user.id
			flash[:notce] = "Account created successfully."
		else
			flash[:alert] = "Account creation failed."
		end

		redirect_to root_path
	end

	private
		def user_params
			params.permit(:username, :password)
		end
end
