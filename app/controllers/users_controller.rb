class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: @user.id)
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
