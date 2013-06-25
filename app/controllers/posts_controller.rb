class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.includes(:categories).order(created_at: :desc).page params[:page]
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
