class SessionsController < ApplicationController

	def create
		if Seller.find_by(email: params[:session][:email]) == nil
			user = Buyer.find_by(email: params[:session][:email].downcase)
		else
			user = Seller.find_by(email: params[:session][:email].downcase)
		end

		if user && user.authenticate(params[:session][:password])
			session[:username] = user.first_name
			
			flash[:success] = "you have successfully been logged in"
			redirect_to root_path
		else
			flash.now[:danger] = "There is a problem with your log in credentials."
			render 'new.html.erb'
		end
	end

	def new
		render 'new.html.erb'
	end

	def destroy
		session[:username] = nil
		flash[:notice] = "You have been logged out"
		redirect_to root_path
	end
end