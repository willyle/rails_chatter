class PostsController < ApplicationController
	def index
	end
	def create
		p "*********************"
		p params.inspect
		@post = Post.new(post_params)
		@post.user_id = session[:user_id]

		if @post.save
			flash[:notice] = "A post was created."
		else
			flash[:alert] = "You failed at creating a post."
		end
		redirect_to root_path
	end

	private
		def post_params
			params.require(:post).permit(:message)
		end
end