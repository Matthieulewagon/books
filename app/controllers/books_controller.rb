class BooksController < ApplicationController
  def index
    @books = Book.all
      # if params[:book].present?
    #     if params[:book][:campus].present?
    #       @books = @books.where(campus: params[:book][:campus])
    #   end
    #   if params[:book][:year].present?
    #     @books = @books.where(params[:book][:year])
    #   end
    # end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
