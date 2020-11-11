class UsersController < ApplicationController
  def index
    @external_transportations = current_user.transportations.order('created_at DESC')
    @external_sum = 0
    @external_transportations.each do |t|
      if t.group == nil
      @external_sum += t.distance
      end
    end
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
