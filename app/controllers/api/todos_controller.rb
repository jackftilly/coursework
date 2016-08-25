class Api::TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def create
    @todo_list = Todo.create(todo_params)
    render json: @todo_list
  end

  def update

  end

  def destroy

  end

  private
  def todo_params
    params.require(:todo).permit(:title, :body)
  end
end
