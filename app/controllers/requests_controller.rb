class RequestsController < ApplicationController
  before_action :if_not_sign_up, only: [:create]
  before_action :authenticate_user!, only: [:create]

  def new
    @book = Book.find(params[:book_id])
    @user = User.find(@book.user_id)
    @books = Book.all
    @user_books = Book.where(user_id: @user.id)
    @request = Request.new
  end

  def create
    @request = Request.new
    @request.update_attributes(book_id: params[:book_id], seller_id: params[:user_id], description: params[:request][:description], contact: params[:request][:contact], facebook: params[:request][:facebook], whatsapp: params[:request][:whatsapp], gsm: params[:request][:gsm], email: params[:request][:email] , buyer_id: current_user.id)
    if (@request.facebook == "on" && current_user.facebook.nil?)|| (@request.gsm == "on" && current_user.gsm.nil?) || (@request.email == "on" && current_user.email.nil?)
      @request.destroy
      redirect_to edit_user_registration_path
    else
      @request.save!
      redirect_to dashboard_path
    end
  end

  def show
  end

  def destroy
   @request = Request.find(params[:id])
   @request.destroy
   redirect_to dashboard_path(current_user)
 end

 def request_params
  params.require(:request).permit(:description, :contact, :gsm, :facebook, :whatsapp, :buyer_id, :seller_id, :book_id)
end

def book_params
  params.require(:book).permit(:user_id, :description, :title,  :price, :picture, :campus, :year, :picture_cache)
end

def if_not_sign_up
  if !user_signed_in?
    redirect_to facebookconnect_index_path
  end
end
end
