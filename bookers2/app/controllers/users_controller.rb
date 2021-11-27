class UsersController < ApplicationController

  def show
     @user = User.find(params[:id])
     @books = Book.new
     @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user.save
       flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    end
  end

  def index

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
       flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end