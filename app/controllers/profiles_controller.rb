class ProfilesController < ApplicationController
	def show
		@profile = Profile.find(params[:id])
		@posts = Post.where(user_id: session[:user_id]).order(created_at: :DESC)
		@user = User.find(params[:id])
		@profile_followees = @user.users
		@my_followees = User.find(session[:user_id]).users
	end
	def new
	end
	def create
	end
	def edit
		@profile = Profile.find(session[:user_id])
	end
	def update
		@profile = Profile.find(session[:user_id])
		if @profile.update(profile_params)
			flash[:notice] = "Your profile was updated successfully."
		else
			flash[:alert] = "Profile update failed"
		end

		redirect_to root_path
	end
	def destroy
	end
	private
		def profile_params
			params.require(:profile).permit(:fname, :lname, :email, :gender, :work, :birthday)
		end
end
