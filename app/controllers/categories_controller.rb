class CategoriesController < ApplicationController
    before_action :require_user 
    before_action :require_admin


	def index
		@categories = Category.all
		render 'index.html.erb'
	end

	def new
		@categorie = Category.new
		render 'new.html.erb'
	end

	def create
		@categorie = Category.new(categorie_params)
		if @categorie.save
            flash[:notice] = "Added new Category"
            redirect_to root_path
        else
            render 'new.html.erb'
        end
	end

	def edit
		 @categorie = Category.find(params[:id])
        render 'edit.html.erb'
    end

    def update
    	@categorie = Category.find(params[:id])

        if @categorie.update(categorie_params)
            flash[:notice] = "Successfully update Category"
            redirect_to root_path
        else
            render 'edit.html.erb'
        end

    end

    def destroy
        @categorie = Category.find(params[:id])

        @categorie.destroy
        flash[:notice] = "Successfully removed Category"
        redirect_to root_path
    end
    
    private
        def categorie_params
            params.require(:category).permit(:name)
        end

end
