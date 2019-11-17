class KeywordsController < ApplicationController
    before_action :find_keyword, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        @keywords = Keyword.all.order("created_at DESC")
    end
    def show
    end
    def new
        @keyword = Keyword.new
    end
    def create
        @keyword = Keyword.new(keyword_params)
        if @keyword.save
            redirect_to @keyword, notice: "The keyword was created!"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @keyword.update(keyword_params)
            redirect_to @keyword, notice: "Update successful"
        else
            render 'edit'
        end
    end
    def destroy
        @keyword.destroy
        redirect_to @keyword, notice: "Post destroyed"
    end
    private
    def keyword_params
        params.require(:keyword).permit(:label)
    end
    def find_keyword
        @keyword = Keyword.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
