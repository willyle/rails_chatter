class SessionController < ApplicationController
	def create
		@user = User.find_by(username: params[:username])
		
		if @user
			if @user.password == params[:password]
				session[:user_id] = @user.id
				flash[:notice] = "You have login successfully."
			else
				flash[:alert] = "Your login information is incorrect."
			end
		end

		redirect_to root_path
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end
end
