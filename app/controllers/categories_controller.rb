class CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        @categories = Category.all.order("created_at DESC")
    end
    def show
    end
    def new
        @category = Category.new
    end
    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to action: "index"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @category.update(category_params)
            redirect_to action: "index"
        else
            render 'edit'
        end
    end
    def destroy
        @posts = Post.where(category_id: @category.id)
        @posts.each do |post|
            post.destroy
        end

        @category.destroy
        redirect_to action: "index"
    end
    private
    def category_params
        params.require(:category).permit(:name)
    end
    def find_category
        @category = Category.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
