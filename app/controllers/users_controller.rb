class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record
  skip_before_action :authorized, only: [:create, :index, :show]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find_by(id: params[:id])
    render json: {data: UserSerializer.new(@user)}, status: :created
  end

  # POST /users
  def create 
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
        user: UserSerializer.new(user), 
        token: @token
    }, status: :created
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:firstName, :lastName, :username, :bio, :gender, :phoneNo, :profileImageURL, :password)
    end

    def handle_invalid_record(e)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
