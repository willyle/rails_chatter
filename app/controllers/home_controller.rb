class HomeController < ApplicationController
  def index
  	@title = "Welcome to Chatter"
  	if session[:user_id]
  		@profile = Profile.find_by(user_id: session[:user_id])
  		redirect_to profile_path(@profile)
  	end
  end
end
