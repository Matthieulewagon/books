class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @books = Book.all
    if params[:book].present? || params[:query].present?
      if params[:query].present?
        # raise
        books_id = Book.search(params[:query], page: params[:page])
        @books = books_id.each do |book_id|
          book_id.id
        end
      end
      if params[:book][:year].present?
        @books = @books.select do |book|
          book if book[:year] == params[:book][:year]
        end
      end
      if params[:book][:campus].present?
        @books = @books.select do |book|
          book if book[:campus] == params[:book][:campus]
        end
      end
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find @book.user_id
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

  def autocomplete
    render json: Book.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  end

  def book_params
    params.require(:book).permit(:user_id, :description, :title,  :price, :picture, :campus, :year, :picture_cache)
  end

end
