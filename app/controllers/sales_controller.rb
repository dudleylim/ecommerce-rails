class SalesController < ApplicationController	
	def index
		@sales = Sale.all
		render 'index.html.erb'
	end

	def new
		@sale = Sale.new
		render 'new.html.erb'
	end

	def create
		@sale = Sale.new(sales_params)

		@sale.seller_id = current_user.id
		@sale.buyer_id = nil
		
		if @sale.save
			redirect_to root_path
		else
			flash[:notice] = "Error"
			render 'new.html.erb'
		end
	end

	def edit
		@sale = Sale.find(params[:id])
		render 'edit.html.erb'
	end

	def update
		@sale = Sale.find(params[:id])

		if @sale.update(sales_params)
			flash[:notice] = "Sale Updated"
			redirect_to sales_path
		else
			flash[:notice] = "Error"
			render 'edit.html.erb'
		end

	end

	def destroy
		@sale = Sale.find(params[:id])

        @sale.destroy
        flash[:notice] = "Successfully removed series"
        redirect_to sales_path
	end

	private
        def sales_params
            params.require(:sale).permit(:seller_id, :buyer_id, :product_id, :price, :remarks)
        end
end
