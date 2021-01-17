

class UsersController < ApplicationController
  helper_method :logged_in?
  before_action :redirect_if_not_logged_in
  skip_before_action :redirect_if_not_logged_in, only: [:create, :new] 

  def new
    @user = User.new
  end

  def show
    current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end  
  end

  private 
  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end  

  def logged_in?
    !!session[:user_id]
  end  

  def redirect_if_not_logged_in
    redirect_to root_path unless logged_in?
  end  

end  