class SinglepostsController < ApplicationController
    layout "homelayout"
    def index
        @posts = Post.all
        # @post_id = params[:post]
        if params[:post].to_s.split('-').count > 1
            params[:post] = params[:post].gsub("-", " ")
        end
        @post_id = Post.where(title: params[:post]).first.id
        @post = Post.find(@post_id)
        @similar_posts = Post.where(category_id: @post.category_id)
    end
end
