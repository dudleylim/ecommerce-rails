class SalesController < ApplicationController	
	before_action :set_sale, only:[:show, :edit, :update, :destroy]
	before_action :require_user
	before_action :require_same_user, only:[:destroy]
	before_action :require_is_not_admin, only:[:new, :create]

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

		if is_buyer?
			@sale.buyer_id = current_user.id
		end

		if @sale.update(sales_params)
			if is_seller?
				flash[:notice] = "Sale Updated"
			elsif is_buyer?
				flash[:notice] = "Thank you for your purchase"
			end
			redirect_to root_path
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
		def set_sale
			@sale = Sale.find(params[:id])
		end

        def sales_params
            params.require(:sale).permit(:seller_id, :buyer_id, :product_id, :price, :remarks)
		end
		
		def require_same_user
			if (current_user != @sale.seller)
				flash[:danger] = "You do not own this sale post"
				redirect_to root_path
			end
		end

		def require_is_not_admin
            if current_user.admin
                flash[:danger] = "You can't add sales as admin"
                redirect_to root_path
            end
        end
end
