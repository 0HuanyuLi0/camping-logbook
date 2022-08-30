class UsersController < ApplicationController

  before_action :check_if_admin, except:[:new,:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.isAdmin = false
    @user.save

    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to lists_path
    else
      render :new
    end
  end


  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update user_params
    redirect_to users_path
  end

  def destroy
    User.destroy params[:id]
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:isAdmin)
  end
end
