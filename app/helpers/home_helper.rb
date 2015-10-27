module HomeHelper
	def fullname
		@profile = Profile.find(params[:id])
		@profile.fname + " " + @profile.lname
	end
end
