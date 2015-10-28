class FollowsController < ApplicationController
	def create
		@follow = Follow.new
		@follow.followee_id = params[:id]
		@follow.follower_id = session[:user_id]
		if @follow.save
			flash[:notice] = "The follow was created successfully."
		else
			flash[:alert] = "The follow failed."
		end
		redirect_to root_path
	end
	def destroy
		@follow = Follow.where(followee_id: params[:id], follower_id: session[:user_id]).first
		if @follow.destroy
			flash[:notice] = "The follow was deleted successfully."
		else
			flash[:alert] = "The follow failed at deleting."
		end
		redirect_to root_path
	end
end