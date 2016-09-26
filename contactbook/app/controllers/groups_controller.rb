class GroupsController < ApplicationController
  def index
    render json: Group.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group
    else
      render json: @group.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    render json: @group
  end

  def update
    @group = Group.find_by(id: params[:id])
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors.full_messages
    end
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    if @group.destroy
      render json: @group
    else
      render json: @group.errors.full_messages
    end
  end

  private
  def group_params
    params.require(:group).permit(:user_id)
  end
end
