class UsersController < ApplicationController
  skip_before_action :authentication_required, only:[:new, :create]
  before_action :set_user, only:[:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
