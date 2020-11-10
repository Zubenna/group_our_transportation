class TransportationsController < ApplicationController
  def new
    @transportation = Transportation.new
  end

  def index
    # @transportations = Transportation.all
    @transportations = current_user.transportations
    @sum = @transportations.sum(:distance)
    # @transportations = @user.transportations
  end

  def create
    @user = current_user
    @transportation = @user.transportations.build(transportation_params)
    @transportation.image.attach(params[:transportation][:image])
    if @transportation.save
      flash[:notice] = 'Transportation created successfully'
      redirect_to transportations_path(@transportation)
    else
      flash[:notice] = 'Something is wrong'
      render('new')
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end
  
  private
  def transportation_params
    params.require(:transportation).permit(:name, :distance)
  end
end
