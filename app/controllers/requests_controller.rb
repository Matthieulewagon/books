class RequestsController < ApplicationController
  before_action :if_not_sign_up, only: [:create]

  def new
    @book = Book.find(params[:book_id])
    @user = User.find(@book.user_id)
    @request = Request.new
  end

  def create
    @request = Request.new
    @request.update_attributes(book_id: params[:book_id], seller_id: params[:user_id], description: params[:request][:description], contact: params[:request][:contact] , buyer_id: current_user.id)
    @request.save!


    redirect_to books_path
  end

  def show
  end

  def destroy
  end

  def request_params
      params.require(:request).permit(:description, :contact,  :buyer_id, :seller_id, :book_id)
  end

  def book_params
    params.require(:book).permit(:user_id, :description, :title,  :price, :picture, :campus, :year, :picture_cache)
  end

  def if_not_sign_up
    if !user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
