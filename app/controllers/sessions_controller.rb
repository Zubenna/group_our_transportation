class SessionsController < ApplicationController
  def new
    @page_title = 'User Login'
  end

  def index
    @page_title = 'Home'
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      flash[:notice] = 'You have logged in successfully'
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Something is wrong'
      render 'new'
    end
  end

  def destroy
    flash[:notice] = 'You have logged out successfully'
    session.delete(:user_id)
    session.delete(:username)
    @current_user = nil
    redirect_to('/')
  end
end
