module SessionsHelper
	def log_in(user, password)
		if user.nil?
			flash[:errors] = "User does not exist!"
		else
			if user.password == password
				flash[:success] = "Logged in!"
				user.update_attributes(:remember_token => SecureRandom.hex(10))
				session[:remember_token] = user.remember_token
			else
				flash[:errors] = "Incorrect password."
			end
		end
	end

	def current_user
		User.find_by_remember_token(session[:remember_token])
	end

	def logged_in?
		if current_user.remember_token == session[:remember_token]
			return true
		else
			log_out
			return false
		end
	end

	def log_out
		session[:remember_token] = nil
		flash[:success] = "Logged out!"
		redirect_to new_session_url
	end
end
