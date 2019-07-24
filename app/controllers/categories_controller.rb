class CategoriesController < ApplicationController
    before_action :require_user 
    before_action :require_admin


	def index
		@categories = Categories.all
		render 'index.html.erb'
	end

	def new
		@categorie = Categories.new
		render 'new.html.erb'
	end

	def create
		@categorie = Categories.new(categorie_params)
		if @categorie.save
            flash[:notice] = "Added new Category"
            redirect_to root_path
        else
            render 'new.html.erb'
        end
	end

	def edit
		 @categorie = Categories.find(params[:id])
        render 'edit_categorie.html.erb'
    end

    def update
    	@categorie = Categories.find(params[:id])

        if @categorie.update(categorie_params)
            flash[:notice] = "Successfully update Category"
            redirect_to categories_index_path
        else
            render 'edit_categorie.html.erb'
        end

    end

    def delete
        @categorie = Categories.find(params[:id])

        @categorie.destroy
        flash[:notice] = "Successfully removed Category"
        redirect_to categories_index_path
    end
    
    private
        def categorie_params
            params.require(:categorie).permit(:name)
        end

end
