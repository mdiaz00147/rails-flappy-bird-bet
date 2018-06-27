module SessionsHelper

	def log_in(user)
    	session[:user_id]    = user.id
      session[:instructor] = user.class.name == 'Instructor' ? true : false
  	end

  	def log_out
    	session.delete(:user_id)
    	@current_admin = nil
  	end

  	def current_user
    	@current_user ||= User.find_by(id: session[:user_id])
   	end

   	def logged_in?
   		!current_user.nil?
    end

    def current_user?(user)
      user == current_user
    end

    def check_admin
      unless current_user.present? && current_user.roll == 'admin'
        redirect_to login_admin_path
      end
    end

    def check_buyer
      if !current_user.present?
        flash[:warning] = 'Debes iniciar sesion'
        redirect_to root_path
      end
    end

    def check_seller
      if !current_user.present? && current_user.roll != 'admin'
        redirect_to root_path
      end
    end

    def check_provider
      unless current_user.present? && current_user.roll == 'admin'
        redirect_to root_path
      end
    end


end
