class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
 @books = Book.all
      if params[:book].present?
        if params[:book][:title].present?
          @books = @books.where(title: params[:book][:title])
        end
        if params[:book][:year].present?
          @books = @books.where(year: params[:book][:year])
        end
        if params[:book][:campus].present?
           @books = @books.where(campus: params[:book][:campus])
        end


       end
       # return @books
       # raise
       if params[:query].present?
        # raise
         @books = Book.search(params[:query], page: params[:page])
           # if params[:book].present?
           #   if params[:book][:year].present?
           #      @books = @books.where(year: params[:book][:year])
           #   end
           #   if params[:book][:campus].present?
           #     @books = @books.where(campus: params[:book][:campus])

           #   end
           # end
           # raise
       end
      # else
      #   @books = Book.all


  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save!
    raise
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def book_params
      params.require(:book).permit(:description, :title,  :price, :picture, :campus, :year)
  end
end
