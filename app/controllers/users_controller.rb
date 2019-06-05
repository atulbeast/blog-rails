class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @users = User.all

    render json: UserSerializer.new(@user).serialized_json
  end

  # GET /articles/1
  def show
    render json: UserSerializer.new(@user).serialized_json
  end

  # POST /articles
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UserSerializer.new(@user).serialized_json, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @user.update(user_params)
      render json: UserSerializer.new(@user).serialized_json
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.fetch(:user, {}).permit(:email, :name)
    end
end
