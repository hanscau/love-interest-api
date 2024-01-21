class ReplyLikesController < ApplicationController
  before_action :set_reply_like, only: %i[ show update destroy ]

  # GET /reply_likes
  def index
    @reply_likes = ReplyLike.all

    render json: @reply_likes
  end

  # GET /reply_likes/1
  def show
    render json: @reply_like
  end

  # POST /reply_likes
  def create
    @reply_like = ReplyLike.new(reply_like_params)

    if @reply_like.save
      render json: @reply_like, status: :created, location: @reply_like
    else
      render json: @reply_like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reply_likes/1
  def update
    if @reply_like.update(reply_like_params)
      render json: @reply_like
    else
      render json: @reply_like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reply_likes/1
  def destroy
    @reply_like.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply_like
      @reply_like = ReplyLike.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_like_params
      params.require(:reply_like).permit(:user_id, :reply_id)
    end
end
