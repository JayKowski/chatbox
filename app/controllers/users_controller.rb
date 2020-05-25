# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'new user successfully created'
      redirect_to tweets_path
    else
      flash[:danger] = 'new user not created'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :prof_photo, :cover_photo)
  end
end
