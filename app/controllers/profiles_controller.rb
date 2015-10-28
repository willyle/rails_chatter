class ProfilesController < ApplicationController
	def show
		@profile = Profile.find(params[:id])
		@posts = @profile.user.posts.order(created_at: :DESC)
		@profile_followees = User.find(@profile.user.id).users
		@my_followees = User.find(session[:user_id]).users

		@comments = []
		@posts.each do |post|
			@comments += post.comments
		end
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
