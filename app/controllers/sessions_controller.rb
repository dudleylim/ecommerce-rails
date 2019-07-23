class SessionsController < ApplicationController

	def create
		user = Seller.find_by(email: params[:session][:email].downcase

		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id

			flash[:success] = "you have successfully been logged in"
			redirect_to #seller_path
		else
			flash.now[:danger] = "There is a problem with your log in credentials."
			render 'new'
	end

	def new
		render 'new.html.erb'
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have been logged out"
		redirect_to root_path
	end
end