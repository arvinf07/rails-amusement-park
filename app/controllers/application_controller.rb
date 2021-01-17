class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user


  private
  def current_user
    if session[:user_id]
      @user ||= User.find_by_id(session[:user_id])
    elsif params[:user]
      @user ||= User.find_by_id(params[:user][:name])
    end  
  end

end
