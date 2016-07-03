class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
    @submit = 'Save'
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def followings
    @title = "followings"
    @user = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end
  
  def followers
    @title = "followers"
    @user = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follow'
  end

  def edit
    @submit = 'Update'
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "Your Profile has been edited"
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :birthday, :introduction, :location, :website)
  end
  
  def set_params
    @user = User.find(params[:id])
  end

  def correct_user
    redirect_to root_path if @user != current_user
  end
end
