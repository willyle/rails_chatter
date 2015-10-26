class HomeController < ApplicationController
  def index
  	@title = "Welcome to Chatter"
  	if session[:user_id]
  		redirect_to profile_path(user_id: session[:user_id])
  	end
  end
end
