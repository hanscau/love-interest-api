class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]
  skip_before_action :authorized, only: [:index, :show, :topic_posts, :user_posts]

  # GET /posts
  def index
    @posts = Post.all.with_attached_image.includes(:topic, :user, :post_likes)
    render json: @posts, status: :ok
  end

  # GET /posts/1
  def show
    @posts = Post.includes(:topic, :user, :post_likes).find(params[:id])
    render json: @posts, status: :ok
  end

  #GET /posts/topic/:topic_id
  def topic_posts
    @posts = Post.all.with_attached_image.includes(:topic, :user, :post_likes).where(topic_id: params[:topic_id])
    render json: @posts, status: :ok
  end

  #GET /posts/user/:user_id
  def user_posts
    @posts = Post.all.with_attached_image.includes(:topic, :user, :post_likes).where(user_id: params[:user_id])
    render json: @posts, status: :ok
  end

  # POST /posts
  def create
    # @post = Post.new(post_params)
    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render json: @post, status: :accepted

  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
  end

  def image
    return unless object.image.attached?
    object.image.blob.attributes
          .slice('filename', 'byte_size', 'id')
          .merge(url: image_url(object.image))
  end

  def image_url(image)
    rails_blob_path(image, only_path: true)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:user_id, :topic_id, :title, :tags, :contentType, :content, :image)
    end
end
