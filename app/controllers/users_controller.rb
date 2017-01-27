class UsersController < ApplicationController
  def show
    @books = Book.where(user_id: current_user.id)
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find([current_user.id])
  end

  def update
  end
  def create
  end
end
