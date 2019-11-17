class PagesController < ApplicationController
    before_action :find_page, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        @pages = Page.all.order("created_at DESC")
    end
    def show
    end
    def new
        @page = Page.new
    end
    def create
        @page = Page.new(page_params)
        if @page.save
            redirect_to @page, notice: "The page was created!"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @page.update(page_params)
            redirect_to @page, notice: "Update successful"
        else
            render 'edit'
        end
    end
    def destroy
        @page.destroy
        redirect_to @page, notice: "Post destroyed"
    end
    private
    def page_params
        params.require(:page).permit(:title, :content)
    end
    def find_page
        @page = Page.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
