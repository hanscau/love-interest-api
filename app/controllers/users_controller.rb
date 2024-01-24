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
    render json: @user
  end

  # POST /users
  def create 
    user = User.create!(user_params)
    @token = encode_token(user_id: user.id)
    render json: {
        user: UserSerializer.new(user), 
        token: @token
    }, include: ['image'], status: :created
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    # to_delete = params(:image_to_delete)
    @user.update(user_params)

    # if to_delete
    #   image = @user.image.find(id)
    #   image.purse_later
    # end 

    render json: @user, status: :accepted
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy!
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

  def profileImageURL
    rails_blob_url(object.image) if object.image.attached?
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:firstName, :lastName, :username, :bio, :gender, :phoneNo, :image, :password)
    end

    def handle_invalid_record(e)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
