class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]
    before_action :check_admin, only: [:index]
    def index
        if params[:category].blank?
            @posts = Post.all.paginate(page: params[:page], per_page:4)
            @categories = Category.all.order("created_at DESC")
        else
            @category_id = params[:category]
            @posts = Post.where(category_id: @category_id).order("created_at DESC")
            @categories = Category.all.order("created_at DESC")
        end
    end
    def show
        set_meta_tags title: @post.title,
                description: @post.content.present? ? @post.content : "All the customer can apply the scholarships all over the world"
    end
    def new
        @post = Post.new
    end
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, notice: "The post was created!"
        else
            render 'new'
        end
    end
    def edit
    end
    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Update successful"
        else
            render 'edit'
        end
    end
    def destroy
        @post.destroy
        redirect_to @post, notice: "Post destroyed"
    end
    private
    def post_params
        params.require(:post).permit(:title, :content, :category_id, :country)
    end
    def find_post
        @post = Post.find(params[:id])
    end
    def check_admin
        if !current_user
            redirect_to root_path
        end
    end
end
