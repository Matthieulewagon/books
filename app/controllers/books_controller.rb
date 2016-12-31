class BooksController < ApplicationController
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
