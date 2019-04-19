class RegistrationsController < ApplicationController
	def new
	
	end

	def create
	    #complete this method
		@user = User.create(user_params)

		if @user.save
			flash[:notice] = "Success registration"
			redirect_to root_url
		else
			flash[:notice] = "Error."
			redirect_to registrations_url
		end
	end

	private
		def user_params
			params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
		end

end
