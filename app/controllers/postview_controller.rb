class PostviewController < ApplicationController
    layout "homelayout"
    def index
        if params[:category].blank?
            if params[:country].blank?
                @posts = Post.all.order("created_at DESC")
                @categories = Category.all.order("created_at DESC")
            else
                @country_id = params[:country]
                @posts = Post.where(country:@country_id)
            end
        else
            if params[:count_code].blank?
                @posts = Post.all.order("created_at DESC")
                @category_id = params[:category]
                @posts = Post.where(category_id:@category_id)
            else
                @country_id = params[:country]
                @posts = Post.where(country:@country_id)

            end
        end
    end
    def shown
        @post_id = params[:post]
        @post = Post.find(@post_id)
    end
end
