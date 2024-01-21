class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]
  skip_before_action :authorized, only: [:index, :show]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    @comment = Comment.includes(:user, :comment_likes, replies: [:user, :reply_likes]).where(post_id: params[:id])
    render json: @comment.as_json(include: [:user, :comment_likes, { replies: { include: [:user, :reply_likes] } }])
  end 

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :commentText)
    end
end
