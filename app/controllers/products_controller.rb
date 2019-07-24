class ProductsController < ApplicationController
    before_action :require_admin, only:[:edit, :update, :delete]

	def index
		@products = Product.all
		render 'index.html.erb'
	end

	def new
        @product = Product.new
        @categories = Category.all
		render 'new.html.erb'
	end

	def create
		@product = Product.new(product_params)
        @categorie = Category.all
		if @product.save
            flash[:notice] = "Added new Product"
            redirect_to root_path
        else
            render 'new.html.erb'
        end
	end

	def edit
		 @product = Product.find(params[:id])
        render 'edit_product.html.erb'
    end

    def update
    	@product = Product.find(params[:id])

        if @product.update(product_params)
            flash[:notice] = "Successfully update Product"
            redirect_to root_path
        else
            render 'edit_product.html.erb'
        end

    end

    def delete
        @product = Product.find(params[:id])

        @product.destroy
        flash[:notice] = "Successfully removed Product"
        redirect_to root_path
    end
    
    private
        def product_params
            params.require(:product).permit(:name, :description, :category_id)
        end

        

end
