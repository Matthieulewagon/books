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
  # @book = Book.new.update_attributes(description: params[:book][:description], title: params[:book][:title], price: params[:book][:price], campus: params[:book][:campus], year: params[:book][:year], user_id: current_user.id)

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @book.save!
    if @book.save
      redirect_to books_path(@book)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def book_params
      params.require(:book).permit(:user_id, :description, :title,  :price, :picture, :campus, :year)
  end

end
