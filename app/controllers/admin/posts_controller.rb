module Admin
  class PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

    def index
      @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.assign_attributes(post_params)
      if @post.save
        redirect_to admin_posts_path, notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully deleted.'
    end

    private

    def post_params
      params.require(:post).permit(:title, :content, :published_at, :image_url)
    end
  end
end
