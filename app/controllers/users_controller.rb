class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
  end

  def new
    @page_title = 'User Sign Up'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.picture.attach(params[:user][:picture])
    if @user.save
      session[:author_id] = @user.id
      flash[:notice] = 'User created successfuly. Please, login'
      redirect_to '/'
    else
      flash.now[:notice] = 'Something went wrong'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'User updated successfuly'
      redirect_to user_path(@user)
    else
      flash.now[:notice] = 'Something went wrong'
      render 'new'
    end
  end

  def delete; end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :picture, :email, :username)
  end
end
