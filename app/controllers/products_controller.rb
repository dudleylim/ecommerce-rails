class ProductsController < ApplicationController
	def index
		@products = Products.all
		render 'index.html.erb'
	end

	def new
		@product = Products.new
		render 'new.html.erb'
	end

	def create
		@product = Products.new(product_params)
		if @product.save
            flash[:notice] = "Added new Product"
            redirect_to products_index_path
        else
            render 'new.html.erb'
        end
	end

	def edit
		 @product = Products.find(params[:id])
        render 'edit_product.html.erb'
    end

    def update
    	@product = Products.find(params[:id])

        if @product.update(product_params)
            flash[:notice] = "Successfully update Product"
            redirect_to products_index_path
        else
            render 'edit_produtc.html.erb'
        end

    end

    def delete
        @product = Products.find(params[:id])

        @product.destroy
        flash[:notice] = "Successfully removed Product"
        redirect_to products_index_path
    end
    
    private
        def product_params
            params.require(:product).permit(:name, :description, :category_id)
        end

end
