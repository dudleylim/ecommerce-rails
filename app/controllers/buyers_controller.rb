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
        @buyer = Buyer.find(params[:id])
        render 'edit.html.erb'
    end

    def update
        @buyer = Buyer.find(params[:id])

        if @buyer.update(buyer_params)
            flash[:notice] = "Profile Updated"
            redirect_to @buyer
        else
            flash[:notice] = "Error"
            render 'edit.html.erb'
        end
    end

    def show
        @buyer = Buyer.find(params[:id])
        @sale = Sale.where(buyer_id: params[:id])
        render 'show.html.erb'
    end
    
    private
        def buyer_params
            params.require(:buyer).permit(:email, :first_name, :last_name, :password, :sex, :birthday)
        end
end
