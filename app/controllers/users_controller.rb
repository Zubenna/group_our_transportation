class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created successfuly'
      redirect_to('/')
    else
      flash[:notice] = 'Something is wrong'
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
