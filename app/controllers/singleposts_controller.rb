class SinglepostsController < ApplicationController
    layout "homelayout"
    def index
        @posts = Post.all
        @post_id = params[:post]
        @post = Post.find(@post_id)
        @similar_posts = Post.where(category_id: @post.category_id)
    end
end
