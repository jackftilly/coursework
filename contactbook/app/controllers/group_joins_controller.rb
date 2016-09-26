class GroupJoinsController < ApplicationController
  def index
    render json: GroupJoin.all
  end

  def create
    @group_join = GroupJoin.new(group_join_params)
    if @group_join.save
      render json: @group_join
    else
      render json: @group_join.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @group_join = GroupJoin.find_by(id: params[:id])
    render json: @group_join
  end

  def update
    @group_join = GroupJoin.find_by(id: params[:id])
    if @group_join.update(group_join_params)
      render json: @group_join
    else
      render json: @group_join.errors.full_messages
    end
  end

  def destroy
    @group_join = GroupJoin.find_by(id: params[:id])
    if @group_join.destroy
      render json: @group_join
    else
      render json: @group_join.errors.full_messages
    end
  end

  private
  def group_join_params
    params.require(:group_join).permit(:contact_id, :group_id)
  end
end
