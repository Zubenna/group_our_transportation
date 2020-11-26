class SessionsController < ApplicationController
  def new
    @page_title = 'User Login'
  end

  def index
    @page_title = 'Home'
  end

  def external
    return if current_user.transportations.size.zero?

    @external_transportations = current_user.transportations.desc.reject { |t| t.groups.exists? }
    @external_sum = 0
    @external_transportations.each do |t|
      @external_sum += t.distance
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      flash[:notice] = 'You have logged in successfully'
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to user_path(@user)
    else
      flash.now[:notice] = 'Something went wrong'
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
