class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def require_logged_out
    redirect_to cats_url if current_user
  end

  def ensure_cat_owner
    redirect_to cats_url unless current_user.cats.include?(Cat.find(params[:id]))
  end
end
