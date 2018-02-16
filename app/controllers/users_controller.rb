class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user)
        .permit(:username, :email, :password, :password_confirmation)
        .reject{ |_, v| v.blank? || v == "" }
    end
end
