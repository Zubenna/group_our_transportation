class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all.order_group
    @groups = current_user.groups.asc unless current_user.groups.size.zero?
  end

  def create
    @user = current_user
    @group = @user.groups.build(group_params)
    @group.icon.attach(params[:group][:icon])
    if @group.save
      flash[:notice] = 'Group added successfully'
      redirect_to groups_path(@group)
    else
      flash.now[:notice] = 'Something is wrong, group not created'
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @groups = Group.all
    @transportations = @group.transportations unless current_user.transportations.size.zero?
    @group_sum = @transportations.sum(:distance)
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:notice] = 'Record updated successfuly'
      redirect_to groups_path
    else
      render('edit')
    end
  end

  def delete
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = 'Record removed successfuly'
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:icon, :name, :author_id)
  end
end
