class SalesController < ApplicationController	
	def index
		@sal = Sale.all
		render 'index.html.erb'
	end

	def new
		@sal = Sale.new
		render 'new.html.erb'
	end

	def create
		@sal = Sale.new(sales_params)
		
		if @sal.save
			redirect_to root_path
		else
			flash[:notice] = "Error"
			render 'new.html.erb'
		end
	end

	def edit
		@sal = Sale.find(params[:id])
		render 'edit.html.erb'
	end

	def update
		@sal = Sale.find(params[:id])

		if @sal.update(sales_params)
			flash[:notice] = "Sale Updated"
			redirect_to sales_path
		else
			flash[:notice] = "Error"
			render 'edit.html.erb'
		end

	end

	def destroy
		@sal = Sale.find(params[:id])

        @sal.destroy
        flash[:notice] = "Successfully removed series"
        redirect_to sales_path
	end

	private
        def sales_params
            params.require(:sale).permit(:name, :seller_id, :buyer_id, :product_id, :price, :remarks)
        end
end
