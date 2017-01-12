class DashboardsController < ApplicationController
  def show
    @requests_seller = Request.where(seller_id: current_user.id).order(created_at: :desc)
    @requests_buyer = Request.where(buyer_id: current_user.id).order(created_at: :desc)
    if @requests_buyer[0] != nil
      @book = Book.find(@requests_buyer[0].book_id)
    end
  end

  def destroy
    @request.destroy
  end

  def book_params
  params.require(:book).permit(:user_id, :description, :title,  :price, :picture, :campus, :year, :picture_cache)
  end
end
