class ProfilesController < ApplicationController
	def show
		@profile = Profile.find(params[:id])
		@posts = Post.where(user_id: session[:user_id]).order(created_at: :DESC)
	end
end
