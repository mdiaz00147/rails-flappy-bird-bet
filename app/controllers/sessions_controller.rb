class SessionsController < ApplicationController
	include SessionsHelper

	def index
		if logged_in?
			redirect_to user_profile_path(current_user.id)
		end
	end

	def create
		user  = User.find_by(email: params[:email].downcase)
		user  = Instructor.find_by(email: params[:email].downcase) if !user
		
		if user && user.authenticate(params[:password])
			log_in user
			if user.class.name == 'Instructor'
				flash[:success] = "Welcome back <span class='text-danger'>instructor</span> #{user.name}"
				redirect_to dashboard_instructor_path 
			else
				flash[:success] = "Welcome back #{user.name}"
				redirect_to dashboard_path
			end
		else
			flash[:danger] = 'Invalid email/Wrong password' # Not quite right!
			redirect_to request.referer
		end
	end
	
	def destroy
		log_out
		flash[:success] = 'Thanks for visit us'
		redirect_to root_url
	end
	private
end
