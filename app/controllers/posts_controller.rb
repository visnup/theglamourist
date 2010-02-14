class PostsController < ApplicationController
  before_filter :check_admin, :only => [ :create, :update, :destroy ]
  respond_to :html, :xml, :json

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.paginate :page => params[:page]
    respond_with @posts do |format|
      format.atom
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    respond_with @post
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
    respond_with @post
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.create(params[:post])
    respond_with @post
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with @post
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post
  end

  private
    def check_admin
      raise SecurityError  unless admin?
    end
end
