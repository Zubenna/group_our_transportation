class TransportationsController < ApplicationController
  def new
    @page_title = 'Add New Transportation'
    @transportation = Transportation.new
  end

  def index
    @page_title = 'List Transportation'
    @transportations = current_user.transportations
    @sum = @transportations.sum(:distance)
  end

  def create
    @user = current_user
    @transportation = @user.transportations.build(transportation_params)
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
    params.require(:transportation).permit(:name, :distance, :group_id)
  end
end
