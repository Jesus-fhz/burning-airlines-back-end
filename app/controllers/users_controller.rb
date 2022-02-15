class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    
    @user.save
    
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to user_path(params[:id])
    else
      flash[:error] = 'Invalid email or password'
      render :new
    end
  end

  def index
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update! user_params
    redirect_to user_path(params[:id])
  end

  def destroy
    User.destroy params[:id]
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :password,
      :password_confirmation
    )
  end
end
