class SessionsController < ApplicationController

  def create
    @user = User.new
  end  

  def signin
    if current_user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signin'  
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end  


end
