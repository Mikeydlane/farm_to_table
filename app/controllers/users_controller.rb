class UsersController < ApplicationController
  before_action :set_user, only: [:show]

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
    require_user
  end

  private

  def user_params
    params.require(:user).permit([:email, :password, :city, :user_type, :description])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_user
    if current_user
      redirect_to current_user unless current_user.id == params[:id].to_i
    end
  end
end
