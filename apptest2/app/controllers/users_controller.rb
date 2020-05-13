class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user?, only: [:edit]

  def index
  	@user_path = User.all
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user information successfully"
    else
      render :edit
    end
  end

   private
    def correct_user?
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless current_user == @user
    end

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end
end

