class UsersController < ApplicationController
  before_action :set_user, :require_user,  only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "S my D from B"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:error] = "S my D from B"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit([:name, :email, :password, :city, :user_type, :description])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
