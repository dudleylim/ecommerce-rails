class SellersController < ApplicationController
    def index
        render 'index.html.erb'
    end

    def new
        @seller = Seller.new
        render 'new.html.erb'
    end

    def create
        @seller = Seller.new(seller_params)

        if @seller.save
			redirect_to root_path
		else
			flash[:notice] = "Error"
			render 'new'
		end
    end

    def edit
    end

    def update
    end

    def show
        
    end
    
    private
        def seller_params
            params.require(:seller).permit(:email, :first_name, :last_name, :password, :sex, :birthday)
        end
end
