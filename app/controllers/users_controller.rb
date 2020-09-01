class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :destroy]
  before_action :authenticate_user
  def new
  @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'user was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @post.destroy
    respond_to do |format|
    format.html { redirect_to root_url, notice: 'Account was successfully destroyed.' }
    format.json { head :no_Account }
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end
  def check_user
    if @user.id != current_user.id
      redirect_to user_path
    end
  end
end
