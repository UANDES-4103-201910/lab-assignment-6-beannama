class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		user = User.find_by(email: user_params[:email])
		if user && user.confirm_password(user_params[:password])
			flash[:notice] = 'Login Success'
			redirect_to user
		else
			flash[:notice] = 'Login Failed'
			redirect_to root_path
		end
	end

	def destroy
		#complete this method
		session.delete(:user_id)
		@current_user = nil
		redirect_to root_path
	end


	def user_params
		params.require(:user).permit(:name, :last_name, :email, :password, :phone)
	end
end
