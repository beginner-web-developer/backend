class Api::V1::UsersController < ApplicationController
  # GET REQUEST FROM DB
  def index
    @user = User.all
    render json: @user, status: 200
  end

  #shows posts that belongs to logged-in user
  def show
    @user = User.find(params[:id])
    if @user
      render json: @user.posts
    else
      render json: {
        error: "No user found"
      }
    end
  end

  # POST REQUEST TO DB
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {
        data: @user,
        status: "success"
      }
    else
      render json: {
        error: @user.errors.full_messages[0],
        status: "failure"
      }
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: {
        message: "Successfully deleted"
      }
    else
      render json: {
        error: "Error: Cannot delete account"
      }
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :name)
  end
end
