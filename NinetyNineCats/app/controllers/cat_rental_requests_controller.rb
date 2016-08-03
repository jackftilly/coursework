class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    @cat_rental_requests = CatRentalRequest.new
  end

  def create
    @cat_rental_requests = CatRentalRequest.new(request_params)
    if @cat_rental_requests.save
      @cat_rental_requests.approve!
      redirect_to cat_rental_request_url(@cat_rental_requests.id)
    else
      @cat_rental_requests.deny!
      render json: @cat_rental_requests.errors.full_messages
    end
  end

  def show
  end

  private
  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
