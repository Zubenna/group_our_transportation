class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @page_title = 'User Sign Up'
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created successfuly. Pease, login'
      # redirect_to user_path(@user)
      redirect_to '/'
    else
      flash[:notice] = 'Something went wrong'
      render('new')
    end
  end

  def delete
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username)
  end
end
