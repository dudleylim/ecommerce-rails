class PagesController < ApplicationController
	def index
		@sales = Sale.all
		@products = Product.all
		@sellers = Seller.all
		@categories = Category.all
		render 'index.html.erb'
	end

	def about
		render 'about.html.erb'
	end

	def signup
		render 'signup.html.erb'
	end
end
