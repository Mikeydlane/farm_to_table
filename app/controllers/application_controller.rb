class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    if current_user
      redirect_to current_user unless current_user.id == params[:id].to_i
    end
  end

end
