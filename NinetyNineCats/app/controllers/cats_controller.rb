class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
    # @requests = CatRentalRequest.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render (@cat.errors.full_messages)
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat.id)
    else
      render (@cat.errors.full_messages)
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :birthdate, :color, :sex, :description)
  end
end
