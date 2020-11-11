class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @groups = Group.all
  end

  def create
    @user = current_user
    @group = @user.groups.build(group_params)
    @group.icon.attach(params[:group][:icon])
    if @group.save
      flash[:notice] = 'Group added successfully'
      redirect_to groups_path(@group)
    else
      flash[:notice] = 'Something is wrong'
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @groups = Group.all
    @transportations = @group.transportations
    @group_sum = @transportations.sum(:distance)
  end

  def edit
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:icon, :name)
  end
end
