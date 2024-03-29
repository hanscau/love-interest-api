class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ show update destroy ]
  skip_before_action :authorized, only: [:index, :show]
  
  # GET /replies
  def index
    @replies = Reply.all

    render json: @replies
  end

  # GET /replies/1
  def show
    @reply = Reply.includes(:reply_likes, :user,).where(comment_id: params[:id])
    render json: @comment
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params)

    if @reply.save
      render json: @reply, status: :created, location: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:user_id, :comment_id, :replyText)
    end
end
