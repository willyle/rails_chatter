module HomeHelper
	def fullname
		if @profile.fname.nil? || @profile.fname == ""
			@profile.user.username
		elsif @profile.lname.nil? || @profile.lname == ""
			@profile.fname
		else
			@profile.fname + " " + @profile.lname
		end
	end
end
