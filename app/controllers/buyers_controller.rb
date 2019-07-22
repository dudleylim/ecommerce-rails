class BuyersController < ApplicationController
    def index
        render 'index.html.erb'
    end

    def new
        @buyer = Buyer.new
        render 'new.html.erb'
    end

    def create
        @buyer = Buyer.new(buyer_params)

        if @buyer.save
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
        def buyer_params
            params.require(:buyer).permit(:email, :first_name, :last_name, :password, :sex, :birthday)
        end
end
