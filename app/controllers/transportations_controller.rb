class TransportationsController < ApplicationController
  def new
    @page_title = 'Add New Transportation'
    @transportation = Transportation.new
  end

  def index
    @page_title = 'List Transportation'
    @transportations = current_user.transportations.order('created_at DESC')
    @sum = 0
    @transportations.each do |t|
      @sum += t.distance  if t.group != nil
    end
  end

  def create
    @user = current_user
    @transportation = @user.transportations.build(transportation_params)
    if @transportation.save
      flash[:notice] = 'Transportation created successfully'
      redirect_to user_path(@user)
    else
      flash[:notice] = 'Something is wrong'
      render('new')
    end
  end

  def show; end

  def destroy
    @transportation = Transportation.find(params[:id])
    @transportation.destroy
    flash[:notice] = 'Record removed successfuly'
    redirect_to transportations_path
  end

  def edit
    @transportation = Transportation.find(params[:id])
  end

  def update
    @transportation = Transportation.find(params[:id])
    if @transportation.update_attributes(transportation_params)
      flash[:notice] = 'Record updated successfuly'
      redirect_to transportations_path
    else
      render('edit')
    end
  end

  private

  def transportation_params
    params.require(:transportation).permit(:name, :distance, :group_id, :user_id, :creator)
  end
end
