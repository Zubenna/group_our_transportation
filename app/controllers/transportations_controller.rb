class TransportationsController < ApplicationController

  def new
    @page_title = 'Add New Transportation'
    @transportation = Transportation.new
    @groups = current_user.groups
  end

  def index
    @page_title = 'List Transportation'
    @transportations = current_user.transportations
    return if @transportations.size.zero?

    @transportations = current_user.transportations.includes([:groups]).desc.select { |t| t.groups.exists? }
    @sum = 0
    @transportations.each do |t|
      @sum += t.distance
    end
  end

  def create
    @transportation = current_user.transportations.build(transportation_params)
    @group = Group.find_by(id: group_params[:group_id])
    @transportation.groups << @group unless @group.nil?

    if @transportation.save
      flash[:notice] = 'Transportation created successfully!'
      redirect_to transportations_path
    else
      flash.now[:notice] = 'Something went wrong'
      render 'new'
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
      flash.now[:notice] = 'Something went wrong'
      render 'edit'
    end
  end

  def delete
    @transportation = Transportation.find(params[:id])
  end
  

  def destroy
    @transportation = Transportation.find(params[:id])
    @transportation.destroy
    flash[:notice] = 'Record deleted'
    redirect_to transportations_path
  end

  private

  def transportation_params
    params.require(:transportation).permit(:name, :distance, :author_id)
  end

  def group_params
    params.require(:transportation).permit(:group_id)
  end
end
