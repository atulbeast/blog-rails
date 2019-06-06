class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    
    @users = User.all

    render json: UserSerializer.new(@users).serialized_json
  end

  # GET /users/1
  def show
    render json: UserSerializer.new(@user).serialized_json
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user).serialized_json, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_user
      @user = User.find_by_email!(params[:_email])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {}).permit(:email, :name, :password, :password_confirmation)
    end
end
