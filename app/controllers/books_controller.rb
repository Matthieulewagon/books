class BooksController < ApplicationController
  def index
    @books = Book.all

      if params[:book].present?
        if params[:book][:year].present?
          @books = @books.where(year: params[:book][:year])
      end
        if params[:book][:campus].present?
          @books = @books.where(campus: params[:book][:campus])
        end
    end
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
