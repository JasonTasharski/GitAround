class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # def current_user
  #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  def current_user
    if session[:user_id]
      if User.exists?(session[:user_id])
        @current_user ||= User.find(session[:user_id])
      else
        session[:user_id] = nil
      end
    end
  end

  helper_method :current_user

  def authorize
    unless current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to root_path
    end
  end
end