class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user,   only: [:edit, :update]

  def index
  	@user = User.find(current_user.id)
  	@book = Book.new
  	@users = User.all

  end

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	@books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:update] = "You have updated user successfully."
  	   redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private 
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end

    def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
    end


end
