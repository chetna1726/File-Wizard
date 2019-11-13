class ApplicationController < ActionController::Base
  helper_method :current_user, :authorize

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def authorize
    unless current_user 
      redirect_to login_path, notice: 'Please login!'
    end
  end
end
