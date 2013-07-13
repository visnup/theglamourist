class PostsController < ApplicationController
  respond_to :html, :xml

  def index
    @posts =
      if params[:category]
        @category = Category.from_param params[:category]
        @category.posts
      else
        Post.all
      end.includes(:categories).order(created_at: :desc).page params[:page]
    respond_with @posts
  end

  def show
    @post = Post.where(link: params[:link]).first
    respond_with @post
  end

  def create
    Post.sync!
    respond_with @post = Post.last
  end
end
