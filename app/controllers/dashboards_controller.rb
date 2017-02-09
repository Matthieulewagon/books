class DashboardsController < ApplicationController
  before_action :authenticate_user!
  def show
    @requests_seller = Request.where(seller_id: current_user.id).order(created_at: :desc)
    @requests_buyer = Request.where(buyer_id: current_user.id).order(created_at: :desc)
    if @requests_buyer[0] != nil
      @book = Book.find(@requests_buyer[0].book_id)
      @seller = User.find(@requests_buyer[0].seller_id)
      @buyer = User.find(@requests_buyer[0].buyer_id)
    end
  end

  def destroy
    @request = Request.where(book_id: params[:book_id])
    @request.each do |request|
      request.destroy
    end
    @book = Book.find(params[:book_id])
    @book.destroy
    redirect_to dashboard_path

  end

  def book_params
  params.require(:book).permit(:user_id, :description, :title,  :price, :picture, :campus, :year, :picture_cache)
  end
end
