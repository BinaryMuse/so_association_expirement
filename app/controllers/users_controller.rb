class UsersController < ApplicationController
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
    @user.update_attributes params[:user]
    redirect_to @user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create params[:user]
    redirect_to @user
  end

  def signin
    @user = User.find params[:id]
    session[:current_user_id] = @user.id if @user
    redirect_to @user
  end

  def signout
    session.delete(:current_user_id)
    redirect_to users_path
  end
end
